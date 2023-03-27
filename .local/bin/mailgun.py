#!/usr/bin/env python3

import asyncio
import random
import string
from typing import Optional
from requests import post, Response
from argparse import ArgumentParser


async def send_simple_message(to: list[str], subject: str, body: str) -> Response:
    return post(
        "https://api.eu.mailgun.net/v3/__domain__/messages",
        auth=("api", "__api-key__"),
        data={
            "from": "Mailgun Mails <mailgun@__domain__>",
            "to": to,
            "subject": subject,
            "text": body,
        },
    )

def generate_random_subject(i: int, prefix: Optional[str] = None):
    subject = f'{prefix} ' + ''.join(random.sample(string.ascii_letters + string.digits, k=25))
    print(f'Subject for mail {i} is {subject!r}')
    return subject

async def main() -> None:
    parser = ArgumentParser(description='Send mails via mailgun')
    parser.add_argument('-t', '--to', action='append')
    parser.add_argument('-b', '--body', default='This is a test mail! Best regards, Tristan')
    parser.add_argument('-c', '--count', type=int, default=1)
    
    parser.add_argument('-s', '--subject')
    parser.add_argument('-r', '--random-subject', action='store_true')

    args = parser.parse_args()

    if not args.random_subject and not args.subject:
        parser.error('Atleast one of random-subject and subject must be given')
    if not args.to:
        args.to = ['__default_main__']

    if args.random_subject:
        requests = [send_simple_message(args.to, generate_random_subject(i + 1, args.subject), args.body) for i in range(args.count)]
    else:
        requests = [send_simple_message(args.to, args.subject, args.body) for _ in range(args.count)]

    responses = await asyncio.gather(*requests)

    for response in filter(lambda r: not r.ok, responses):
        print(f'Bad response [{response.status_code}]:')
        print(response.content)

if __name__ == "__main__":
    asyncio.run(main())
