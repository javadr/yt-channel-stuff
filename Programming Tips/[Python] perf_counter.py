import time
import asyncio


async def pc():
    start = time.perf_counter()
    await asyncio.sleep(4)
    print('perf_counter: ', end='\t')
    print(time.perf_counter() - start)


async def pt():
    start = time.process_time()
    await asyncio.sleep(4)
    print('process_time: ', end='\t')
    print(time.process_time() - start)


async def tt():
    start = time.time()
    await asyncio.sleep(4)
    print('time: ', end='\t\t')
    print(time.time() - start)


async def main():
    tasks = [asyncio.create_task(f()) for f in (tt, pc, pt)]
    await asyncio.gather(*tasks)


asyncio.run(main())
