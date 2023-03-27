WORKTREES=("${HOME}/dev/js/ngCp" "${HOME}/dev/js/hse-components")

# function c() {
#     local preview_cmd='lsd -lh --color always --config-file "${HOME}/.config/lsd/simple-lsd.yml" --group-directories-first ${HOME}/.config/{}'
#     dir=$(find "${HOME}/.config" -mindepth 1 -maxdepth 1 -type d -printf '%P\n' | fzf --preview $preview_cmd --preview-window right:60% --keep-right --scroll-off 3 --height 40%)
#     cd "${HOME}/.config/${dir}"
# }

function s() {
    ssh $(rg -e '^Host' ${HOME}/.ssh/config* | awk '{ print $2 }' | fzf --height 40%) "$@"
}

function fzf-config() {
    local base_path=${HOME}/.config
    echo $base_path/$(
        find $base_path -maxdepth 3 |\
            sed "s#$base_path/##" |\
            sed "\#$base_path#d" |\
            fzf --height 40% --scroll-off 3
    )
}

function c() {
    local target=$(fzf-config)

    if [ -z $target ]; then return; fi

    if [[ -f $target ]]; then
        cd $(dirname $target)
        $EDITOR $target
    else
        cd $target
    fi
}

function jb() {
    "$@" &>/dev/null &!
}

function get-dev-folders() {
    find "${HOME}/dev" -mindepth 2 -maxdepth 2 -type d | (IFS='|'; sed -E "\:(${WORKTREES[*]}):d")

    for wt in $WORKTREES; do
        find $wt -mindepth 1 -maxdepth 1 -type d -not -name '.*'
    done
}

function fzf-dev-folders() {
    local preview_cmd='lsd -lh --color always --config-file "${HOME}/.config/lsd/simple-lsd.yml" --group-directories-first ${HOME}/dev/{}'
    get-dev-folders | sed "s#${HOME}/dev/##" | fzf --preview $preview_cmd --preview-window right:60% --keep-right --scroll-off 3 --height 40%
}

function d() {
    local dir=$(fzf-dev-folders)
    cd "${HOME}/dev/${dir}"
}

function git_current_branch() {
    git branch --show-current
}

function fasd_broot() {
    local outcmd_file="$(mktemp)"
    (
        set +e
        fasd -d -e "broot --outcmd ${outcmd_file}" "$@"
        local exit_code=$?
        if [ "$exit_code" != 0 ]; then
            rm -f "${outcmd_file}"
            exit "$exit_code"
        fi
    )
    local exit_code="$?"
    if [ "$exit_code" != 0 ]; then
        return "$exit_code"
    fi
    local outcmd="$(<"${outcmd_file}")"
    rm -f "${outcmd_file}"
    eval "${outcmd}"
}

function interactive_emerge() {
    local packages="$(eix --compact "$@" | fzf --nth 2 | awk '{ print $2 }')"
    [ -n "${packages}" ] && elev-priv emerge "${packages}"
}

function tiny_url() { 
    curl --silent "https://tinyurl.com/api-create.php?url=$@"
    echo
}

function resize_portage_tmpdir() { 
    elev-priv mount --options "remount,size=$@,nosuid,nodev,noatime" '/var/tmp/portage' 
}

function detect-clipboard() {
  emulate -L zsh

  if [[ "${OSTYPE}" == darwin* ]] && (( ${+commands[pbcopy]} )) && (( ${+commands[pbpaste]} )); then
    function clipcopy() { pbcopy < "${1:-/dev/stdin}"; }
    function clippaste() { pbpaste; }
  elif [[ "${OSTYPE}" == (cygwin|msys)* ]]; then
    function clipcopy() { cat "${1:-/dev/stdin}" > /dev/clipboard; }
    function clippaste() { cat /dev/clipboard; }
  elif [ -n "${WAYLAND_DISPLAY:-}" ] && (( ${+commands[wl-copy]} )) && (( ${+commands[wl-paste]} )); then
    function clipcopy() { wl-copy < "${1:-/dev/stdin}"; }
    function clippaste() { wl-paste; }
  elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xclip]} )); then
    function clipcopy() { xclip -in -selection clipboard < "${1:-/dev/stdin}"; }
    function clippaste() { xclip -out -selection clipboard; }
  elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xsel]} )); then
    function clipcopy() { xsel --clipboard --input < "${1:-/dev/stdin}"; }
    function clippaste() { xsel --clipboard --output; }
  elif (( ${+commands[lemonade]} )); then
    function clipcopy() { lemonade copy < "${1:-/dev/stdin}"; }
    function clippaste() { lemonade paste; }
  elif (( ${+commands[doitclient]} )); then
    function clipcopy() { doitclient wclip < "${1:-/dev/stdin}"; }
    function clippaste() { doitclient wclip -r; }
  elif (( ${+commands[win32yank]} )); then
    function clipcopy() { win32yank -i < "${1:-/dev/stdin}"; }
    function clippaste() { win32yank -o; }
  elif [[ $OSTYPE == linux-android* ]] && (( $+commands[termux-clipboard-set] )); then
    function clipcopy() { termux-clipboard-set "${1:-/dev/stdin}"; }
    function clippaste() { termux-clipboard-get; }
  elif [ -n "${TMUX:-}" ] && (( ${+commands[tmux]} )); then
    function clipcopy() { tmux load-buffer "${1:--}"; }
    function clippaste() { tmux save-buffer -; }
  elif [[ $(uname -r) = *icrosoft* ]]; then
    function clipcopy() { clip.exe < "${1:-/dev/stdin}"; }
    function clippaste() { powershell.exe -noprofile -command Get-Clipboard; }
  else
    function _retry_clipboard_detection_or_fail() {
      local clipcmd="${1}"; shift
      if detect-clipboard; then
        "${clipcmd}" "$@"
      else
        print "${clipcmd}: Platform $OSTYPE not supported or xclip/xsel not installed" >&2
        return 1
      fi
    }
    function clipcopy() { _retry_clipboard_detection_or_fail clipcopy "$@"; }
    function clippaste() { _retry_clipboard_detection_or_fail clippaste "$@"; }
    return 1
  fi
}
detect-clipboard

function fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

function fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

function gh-repo {
    git init
    git config user.name coma64
    git config user.email 'zaton.tristan@gmail.com'
    gh repo create --private --source .

    [[ $1 == "-n" ]] && exit
    git add .
    git commit -m Init
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

function h() {
    local target_dir=$(dirs | tr ' ' '\n' | fzf --height 40%)
    [[ -z $target_dir ]] && return
    cd ${~target_dir}
}
