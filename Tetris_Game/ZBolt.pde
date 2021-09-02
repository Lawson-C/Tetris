class ZBolt extends Tetris {
  boolean isLeft;
  
  ZBolt(PVector pos, boolean isLeft, boolean isOutline) {
    this(pos.x, pos.y, isLeft, isOutline);
  }
  
  ZBolt(float x, float y, boolean isLeft, boolean isOutline) {
    super(x, y, isOutline);
    this.isLeft = isLeft;
  }
  
  ZBolt(Tetris other) {
    super(other);
  }
}
