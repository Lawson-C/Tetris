class ZBolt extends Tetris {
  boolean isLeft;
  
  ZBolt(PVector pos, boolean isLeft, boolean isOutline) {
    super(pos, isOutline);
    this.isLeft = isLeft;
  }
  
  ZBolt(Tetris other) {
    super(other);
  }
}
