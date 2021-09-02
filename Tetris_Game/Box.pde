class Box extends Tetris {
  Box(PVector pos, boolean isOutline) {
    super(pos, isOutline);
    super.sects[0].set(-1, -1);
    super.sects[1].set(0, -1);
    super.sects[2].set(0, 0);
    super.sects[3].set(-1, 0);
    super.c = color(255, 255, 0);
    super.outline = color(205, 205, 0);
  }

  Box(float x, float y, boolean isOutline) {
    this(new PVector(x, y), isOutline);
  }
  
  Box(Tetris other) {
    super(other);
  }
}
