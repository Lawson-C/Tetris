class Stage {
  // blocks[][][0] = fill, blocks[][][1] = outline
  color[][][] blocks = new color[int(stageWidth)][int(stageHeight)][2];

  Stage() {
    for (int x=0; x<stageWidth; x++) {
      for (int y=0; y<stageHeight; y++) {
        blocks[x][y][0] = color(0);
        blocks[x][y][1] = color(255);
      }
    }
  }

  void display() {
    pushMatrix();
    for (int x = 0; x < stageWidth; x++) {
      for (int y = 0; y < stageHeight; y++) {
        stroke(blocks[x][y][1]);
        fill(blocks[x][y][0]);
        rect(x * blockSize + borderWidth, y * blockSize + borderHeight, blockSize, blockSize);
      }
    }
    popMatrix();
  }

  void setBlock(PVector pos, color c, color outline) {
    setBlock(pos.x, pos.y, c, outline);
  }
  
  void setBlock(float x, float y, color c, color outline) {
    blocks[(int) x][(int) y][0] = c;
    blocks[(int) x][(int) y][1] = outline;
  }

  color getBlock(PVector pos, int i) {
    return blocks[int(pos.x)][int(pos.y)][i];
  }

  color getBlock(float x, float y, int i) {
    return blocks[(int) x][(int) y][i];
  }

  void removeRows() {
    int[] indexes = {-1, -1, -1, -1};
    int numRows = 0;
    for (int y=0; y<stageHeight; y++) {
      int tx = 0;
      for (int x=0; x<stageWidth; x++) {
        if (blocks[x][y][0] != color(0)) {
          tx++;
        } else {
          break;
        }
      }
      if (tx == stageWidth) {
        indexes[numRows] = y;
        numRows += 1;
      }
    }
    if (numRows > 0) {
      for (int i=0; i < indexes.length; i++) {
        if (indexes[i] != -1) {
          for (int y=indexes[i]; y >= 0; y--) {
            for (int x=0; x < stageWidth; x++) {
              if (y > 0) {
                blocks[x][y] = blocks[x][y-1];
              } else if (y == 0) {
                blocks[x][y][0] = color(0);
                blocks[x][y][1] = color(255);
              }
            }
          }
        }
      }
    } else {
      for (int i=0; i<stageWidth; i++) {
        if (blocks[i][0][0] != color(0)) {
          //gameOver = true;
        }
      }
    }
    changeScore((float) numRows*200*(1.0 + (float) numRows/indexes.length));
  }
}
