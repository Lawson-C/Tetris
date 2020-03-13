class LBolt extends Tetris {
  boolean isLeft;

  LBolt(PVector pos, boolean isLeft, boolean isOutline) {
    super(pos, isOutline);
    this.isLeft = isLeft;
  }
  
  LBolt(Tetris other) {
    super(other);
  }
}
