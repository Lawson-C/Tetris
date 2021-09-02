class TBolt extends Tetris {
  TBolt(PVector pos, boolean isOutline) {
    super(pos, isOutline);
    super.sects[0] = new PVector(0, -1);
    super.sects[1] = new PVector(-1, 0);
    super.sects[2] = new PVector(0, 0);
    super.sects[3] = new PVector(1, 0);
    super.c = color(205, 0, 205);
    super.outline = color(105, 0, 105);
  }

  TBolt(float x, float y, boolean isOutline) {
    this(new PVector(x,y), isOutline);
  }
  
  TBolt(Tetris other) {
    super(other);
  }

  @Override
    void rot() {
    if (super.rot == 0) {
      super.sects[0] = new PVector(0, -1);
      super.sects[1] = new PVector(-1, 0);
      super.sects[2] = new PVector(0, 0);
      super.sects[3] = new PVector(1, 0);
    } else if (super.rot == 1) {
      super.sects[0] = new PVector(0, -1);
      super.sects[1] = new PVector(0, 0);
      super.sects[2] = new PVector(1, 0);
      super.sects[3] = new PVector(0, 1);
    } else if (super.rot == 2) {
      super.sects[0] = new PVector(-1, 0);
      super.sects[1] = new PVector(0, 0);
      super.sects[2] = new PVector(0, 1);
      super.sects[3] = new PVector(1, 0);
    } else if (super.rot == 3) {
      super.sects[0] = new PVector(0, -1);
      super.sects[1] = new PVector(0, 0);
      super.sects[2] = new PVector(-1, 0);
      super.sects[3] = new PVector(0, 1);
    }
    super.rot();
  }

  @Override
    void turn() {
    super.turn();
    rot();
  }
}
