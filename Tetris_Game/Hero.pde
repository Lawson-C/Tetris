class Hero extends Tetris {
  Hero(PVector pos, boolean isOutline) {
    super(pos, isOutline);
    sects[0].set(0, -2);
    sects[1].set(0, -1);
    sects[2].set(0, 0);
    sects[3].set(0, 1);
    c = color(55, 105, 255);
    outline = color(105, 155, 255);
  }

  Hero(float x, float y, boolean isOutline) {
    this(new PVector(x, y), isOutline);
  }
  
  Hero(Tetris other) {
    super(other);
  }

  @Override
    void rot() {
    if (rot == 0) {
      sects[0].set(0, -2);
      sects[1].set(0, -1);
      sects[2].set(0, 0);
      sects[3].set(0, 1);
    }
    if (rot == 1) {
      sects[0].set(-2, 0);
      sects[1].set(-1, 0);
      sects[2].set(0, 0);
      sects[3].set(1, 0);
    }
    if (rot == 2) {
      sects[0].set(0, -2);
      sects[1].set(0, -1);
      sects[2].set(0, 0);
      sects[3].set(0, 1);
    }
    if (rot == 3) {
      sects[0].set(-2, 0);
      sects[1].set(-1, 0);
      sects[2].set(0, 0);
      sects[3].set(1, 0);
    }
    super.rot();
  }

  @Override
    void turn() {
    super.turn();
    rot();
  }
}
