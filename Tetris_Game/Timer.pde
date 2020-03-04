class Timer {
  long start = 0;
  long end = 0;

  Timer(long end) {
    this.end = end;
    this.start = System.currentTimeMillis();
  }

  boolean finish() {
    return end != -1 && System.currentTimeMillis() - start - end >= 0;
  }
}
