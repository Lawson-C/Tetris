class Hero extends Tetris {
  Hero(PVector pos, boolean isOutline) {
    super(pos, isOutline);
    super.sects[0].set(0, -2);
    super.sects[1].set(0, -1);
    super.sects[2].set(0, 0);
    super.sects[3].set(0, 1);
    super.c = color(55, 105, 255);
    super.outline = color(105, 155, 255);
  }

  Hero(float x, float y, boolean isOutline) {
    this(new PVector(x, y), isOutline);
  }
  
  Hero(Tetris other) {
    super(other);
  }

  @Override
    void rot() {
    if (super.rot == 0) {
      super.sects[0].set(0, -2);
      super.sects[1].set(0, -1);
      super.sects[2].set(0, 0);
      super.sects[3].set(0, 1);
    }
    if (super.rot == 1) {
      super.sects[0].set(-2, 0);
      super.sects[1].set(-1, 0);
      super.sects[2].set(0, 0);
      super.sects[3].set(1, 0);
    }
    if (super.rot == 2) {
      super.sects[0].set(0, -2);
      super.sects[1].set(0, -1);
      super.sects[2].set(0, 0);
      super.sects[3].set(0, 1);
    }
    if (super.rot == 3) {
      super.sects[0].set(-2, 0);
      super.sects[1].set(-1, 0);
      super.sects[2].set(0, 0);
      super.sects[3].set(1, 0);
    }
    super.rot();
  }

  @Override
    void turn() {
    super.turn();
    rot();
  }
}
