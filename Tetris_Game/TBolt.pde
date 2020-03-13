class TBolt extends Tetris {
  TBolt(PVector pos, boolean isOutline) {
    super(pos, isOutline);
    sects[0] = new PVector(0, -1);
    sects[1] = new PVector(-1, 0);
    sects[2] = new PVector(0, 0);
    sects[3] = new PVector(1, 0);
    c = color(205, 0, 205);
    outline = color(105, 0, 105);
  }

  TBolt(float x, float y, boolean isOutline) {
    this(new PVector(x,y), isOutline);
  }
  
  TBolt(Tetris other) {
    super(other);
  }

  @Override
    void rot() {
    if (rot == 0) {
      sects[0] = new PVector(0, -1);
      sects[1] = new PVector(-1, 0);
      sects[2] = new PVector(0, 0);
      sects[3] = new PVector(1, 0);
    } else if (rot == 1) {
      sects[0] = new PVector(0, -1);
      sects[1] = new PVector(0, 0);
      sects[2] = new PVector(1, 0);
      sects[3] = new PVector(0, 1);
    } else if (rot == 2) {
      sects[0] = new PVector(-1, 0);
      sects[1] = new PVector(0, 0);
      sects[2] = new PVector(0, 1);
      sects[3] = new PVector(1, 0);
    } else if (rot == 3) {
      sects[0] = new PVector(0, -1);
      sects[1] = new PVector(0, 0);
      sects[2] = new PVector(-1, 0);
      sects[3] = new PVector(0, 1);
    }
    super.rot();
  }

  @Override
    void turn() {
    super.turn();
    rot();
  }
}
