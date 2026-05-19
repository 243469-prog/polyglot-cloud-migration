import os
import time
import redis

redis_host = os.environ.get("REDIS_HOST", "localhost")
r = redis.Redis(host=redis_host, port=6379, decode_responses=True)

print("Python worker background service started...")
while True:
    try:
        latest_task = r.get("latest_task")
        if latest_task:
            print(f"Processing simulated job: {latest_task}")
            time.sleep(2)
    except Exception as e:
        print(f"Error connecting to Redis: {e}")
    time.sleep(5)
