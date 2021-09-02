class LBolt extends Tetris {
  boolean isLeft;

  LBolt(PVector pos, boolean isLeft, boolean isOutline) {
    this(pos.x, pos.y, isLeft, isOutline);
  }

  LBolt(float x, float y, boolean isLeft, boolean isOutline) {
    super(x, y, isLeft, isOutline);
    super.sects[0].set(isLeft ? -1 : 1, -1);
    super.sects[1].set(-1, 0);
    super.sects[2].set(0, 0);
    super.sects[3].set(1, 0);
    this.isLeft = isLeft;
    super.c = isLeft ? color(155, 105, 0) : color(0, 0, 155);
    super.outline = isLeft ? color(75, 55, 0) : color(0, 0, 75);
  }

  LBolt(Tetris other) {
    super(other);
  }

  @Override
    void rot() {
    if (super.rot == 0) {
      super.sects[0] = new PVector(isLeft ? -1 : 0, -1);
      super.sects[1] = new PVector(isLeft ? -1 : -2, 0);
      super.sects[2] = new PVector(isLeft ? 0 : -1, 0);
      super.sects[3] = new PVector(isLeft ? 1 : 0, 0);
    } else if (super.rot == 1) {
      super.sects[0] = new PVector(0, isLeft ? -1 : 0);
      super.sects[1] = new PVector(-1, isLeft ? -1 : -2);
      super.sects[2] = new PVector(-1, isLeft ? 0 : -1);
      super.sects[3] = new PVector(-1, isLeft ? 1 : 0);
    } else if (super.rot == 2) {
      super.sects[0] = new PVector(isLeft ? 0 : -1, 0);
      super.sects[1] = new PVector(isLeft ? -2 : -1, -1);
      super.sects[2] = new PVector(isLeft ? -1 : 0, -1);
      super.sects[3] = new PVector(isLeft ? 0 : 1, -1);
    } else if (super.rot == 3) {
      super.sects[0] = new PVector(-1, isLeft ? 0 : -1);
      super.sects[1] = new PVector(0, isLeft ? -2 : -1);
      super.sects[2] = new PVector(0, isLeft ? -1 : 0);
      super.sects[3] = new PVector(0, isLeft ? 0 : 1);
    }
    super.rot();
  }

  @Override
    void turn() {
    super.turn();
    rot();
  }
}
