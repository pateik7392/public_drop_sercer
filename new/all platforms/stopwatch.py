import time

class Stopwatch:
    def __init__(self):
        self.start_time = None

    def start(self):
        if self.start_time is None:
            self.start_time = time.time()
        else:
            print("Stopwatch is already running!")

    def stop(self):
        if self.start_time is not None:
            elapsed_time = time.time() - self.start_time
            self.start_time = None
            return elapsed_time
        else:
            print("Stopwatch has not been started.")

if __name__ == "__main__":
    stopwatch = Stopwatch()

    input("Press Enter to start the stopwatch...")
    stopwatch.start()

    input("Press Enter to stop the stopwatch...")
    elapsed_time = stopwatch.stop()
    print(f"Elapsed time: {elapsed_time} seconds")
