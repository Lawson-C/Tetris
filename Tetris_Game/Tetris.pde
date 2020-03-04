class Tetris {
  PVector pos;
  PVector[] sects = new PVector[4];
  color c;
  color outline;
  int rot = 0;
  float move;
  boolean isOutline;
  boolean isLeft;

  Tetris(PVector pos, boolean isOutline, boolean isLeft) {
    this.pos = pos;
    move = .01;
    this.isOutline = isOutline;
    this.isLeft = isLeft;
    for (int i=0; i<sects.length; i++) {
      sects[i] = new PVector(0, 0);
    }
  }
  
  Tetris(PVector pos, boolean isOutline) {
    this(pos, isOutline, false);
  }

  Tetris(float x, float y, boolean isOutline) {
    this(new PVector(x, y), isOutline);
  }
  
  Tetris(float x, float y, boolean isOutline, boolean isLeft) {
    this(new PVector(x, y), isOutline, isLeft);
  }
  
  void move() {
    pos.y += move;
  }

  void moveRight() {
    if (pos.x + sects[rightestSect()].x < stageWidth - 1) {
      if (stage.getBlock(sects[rightestSect()].x + pos.x + 1, sects[rightestSect()].y + pos.y, 0) == color(0)) {
        pos.x += 1;
      }
    }
  }

  void moveLeft() {
    if (pos.x + sects[leftestSect()].x > 0) {
      if (stage.getBlock(sects[leftestSect()].x + pos.x - 1, sects[leftestSect()].y + pos.y, 0) == color(0)) {
        pos.x -= 1;
      }
    }
  }

  boolean collision() {
    for (int i=0; i<sects.length; i++) {
      if (pos.y + sects[i].y + 1 < stageHeight) {
        if (stage.getBlock(new PVector(pos.x + sects[i].x, pos.y + sects[i].y + 1), 0) != color(0)) {
          return true;
        }
      }
    }
    if (!isOutline && sects[lowestSect()].y + pos.y >= stageHeight - 1) {
      return true;
    }
    return false;
  }

  void hitBorder() {
    for (int i=0; i<sects.length; i++) {
      if (sects[i].x + pos.x < 0) {
        pos.x += 1;
      }
      if (sects[i].x + pos.x >= stageWidth) {
        pos.x -= 1;
      }
      if (sects[i].y + pos.y >= stageHeight) {
        pos.y -= 1;
      }
      if (sects[i].y + pos.y < 0) {
        pos.y += 1;
      }
    }
  }

  void hitPieces() {
    if (isOutline) {
      for (int i=int(fallingPiece.pos.y); i<stageHeight; i++) {
        pos.y = i;
        if (collision()) {
          break;
        }
      }
    }
  }

  void turn() {
    rot += 1;
    if (rot > 3) {
      rot = 0;
    }
    if (rot < 0) {
      rot = 3;
    }
  }

  int lowestSect() {
    int out = 0;
    float highest = sects[0].y;
    for (int i=1; i<sects.length; i++) {
      if (sects[i].y > highest) {
        highest = sects[i].y;
        out = i;
      }
    }
    return out;
  }

  int rightestSect() {
    int out = 0;
    float highest = sects[0].x;
    for (int i=1; i<sects.length; i++) {
      if (sects[i].x > highest) {
        highest = sects[i].x;
        out = i;
      }
    }
    return out;
  }

  int highestSect() {
    int out = 0;
    float highest = sects[0].y;
    for (int i=1; i<sects.length; i++) {
      if (sects[i].y < highest) {
        highest = sects[i].y;
        out = i;
      }
    }
    return out;
  }

  int leftestSect() {
    int out = 0;
    float highest = sects[0].x;
    for (int i=1; i<sects.length; i++) {
      if (sects[i].x < highest) {
        highest = sects[i].x;
        out = i;
      }
    }
    return out;
  }

  void setSects(PVector[] sects) {
    this.sects = sects;
  }

  void display() {
    for (int i=0; i<sects.length; i++) {
      stroke(outline);
      fill(c);
      rect(int(pos.x + sects[i].x) * blockSize + borderWidth, int(pos.y + sects[i].y) * blockSize + borderHeight, blockSize, blockSize);
    }
  }

  void rot() {
    int prevRot = rot;
    if (sects[leftestSect()].x + pos.x < 0 || sects[rightestSect()].x + pos.x >= stageWidth) {
      rot -= 1;
    }
    if (rot == prevRot) {
      for (int i=0; i<sects.length; i++) {
        if (pos.x + sects[i].x < 0 || pos.x + sects[i].x >= stageWidth) {
          rot -= 1;
          break;
        }
        if (collision()) {
          rot -= 1;
          break;
        }
      }
    }
    if (rot < 0) {
      rot = 3;
    }
  }
}
