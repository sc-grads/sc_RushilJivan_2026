from datetime import time, datetime
import asyncio
from asyncio import Future

import requests
from requests import Response

async def check_status(url:str) -> dict[str, int | str]:
    start_time: datetime = datetime.now()
    response: Response = await asyncio.to_thread(requests.get, url, None)
    end_time: datetime = datetime.now()

    return {'status': response.status_code,
            'start time': f'{start_time:%H:%M:%S}',
            'end time': f'{end_time:%H:%M:%S}',}


async def main() -> None:
    print('Fetching results')

    tasks: Future = asyncio.gather(
        check_status(url='https://www.google.com'),
        check_status(url='https://www.apple.com'),
        check_status(url='https://www.bing.com'),
        check_status(url='https://www.bbc.com'),
        check_status(url='https:lol'),
        return_exceptions=True
    )

    results: list[dict] = await tasks
    print(results)

    for result in results:
        print(result)

if __name__ == "__main__":
    asyncio.run(main=main())