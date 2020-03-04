import java.util.Arrays;

final int stageWidth = 10;
final int stageHeight = 20;
final int blockSize = 50;
final int borderWidth = 720;
final int borderHeight = 40;

boolean fastDrop = false;
long score = 0;
boolean gameOver = false;

Stage stage;
Tetris fallingPiece;
Tetris holdingPiece;
Tetris outlinePiece;
Timer placeTimer;

void setup() {
  fullScreen();
  stage = new Stage();
  placeTimer = new Timer(-1);
  renewPiece();
}

void draw() {
  background(0);
  if (!gameOver) {
    // falling tile
    fallingPiece.move();
    fallingPiece.hitBorder();

    // outline
    outlinePiece.setSects(fallingPiece.sects);
    outlinePiece.pos.x = fallingPiece.pos.x;
    outlinePiece.hitBorder();
    outlinePiece.hitPieces();
    outlinePiece.hitBorder();

    if (fallingPiece.collision()) {
      fallingPiece.move = 0;
      if (placeTimer.end == -1 && !fastDrop) {
        placeTimer = new Timer(500);
      }
      if (placeTimer.finish() || fastDrop) {
        collide();
        placeTimer = new Timer(-1);
        fastDrop = false;
      }
    }

    stage.removeRows();

    // image creation
    stage.display();
    outlinePiece.display();
    fallingPiece.display();
    try {
      holdingPiece.display();
    }
    catch (NullPointerException e) {
    }
  } else {
    gameOver();
    textSize(50);
    fill(255);
    text("score: " + score, 200, height - 200);
  }
}

void renewPiece() {
  int type = int(random(0, 5));
  if (type == 0) {
    fallingPiece = new Box(stageWidth/2, 2, false);
  }
  if (type == 1) {
    fallingPiece = new TBolt(stageWidth/2, 2, false);
  }
  if (type == 2) {
    fallingPiece = new Hero(stageWidth/2, 2, false);
  }
  if (type == 3) {
    fallingPiece = new Hero(stageWidth/2, 2, false);
  }
  if (type == 4) {
    fallingPiece = new Hero(stageWidth/2, 2, false);
  }
  outlinePiece = getOutline(fallingPiece);
}

void collide() {
  for (int i=0; i < fallingPiece.sects.length; i++) {
    stage.setBlock(fallingPiece.sects[i].x + fallingPiece.pos.x, fallingPiece.sects[i].y + fallingPiece.pos.y, fallingPiece.c, fallingPiece.outline);
  }
  renewPiece();
}

void changeScore(int inc) {
  score += inc;
}

void changeScore(float inc) {
  changeScore((int) inc);
}

void keyPressed() {
  if (key == 'a') {
    fallingPiece.moveLeft();
  } else if (key == 'd') {
    fallingPiece.moveRight();
  }
  if (key == 's') {
    if (fallingPiece.move != 0) {
      fallingPiece.move = 1;
    }
  }
  if (key == 'w') {
    fallingPiece.pos = (outlinePiece.pos);
    fastDrop = true;
  }
  if (key == ' ') {
    fallingPiece.turn();
  }
  if (key == 'q') {
    hold();
  }
}

void keyReleased() {
  if (key == 's') {
    fallingPiece.move = .01;
  }
}

void gameOver() {
  if (keyPressed) {
    if (key == ' ') {
      score = 0;
      setup();
      gameOver = false;
    }
  }
}

void hold() {
  Tetris spare;
  spare = fallingPiece;
  try {
    holdingPiece.pos = new PVector(stageWidth/2, 2);
    fallingPiece = holdingPiece;
  }
  catch (Exception e) {
    renewPiece();
  }
  holdingPiece = spare;
  holdingPiece.pos = new PVector(-2, 5);
  outlinePiece = getOutline(fallingPiece);
}

Tetris getOutline(Tetris in) {
  Tetris out = new Tetris(in.pos.x, stageHeight - 1, true);
  out.sects = in.sects;
  out.outline = in.c;
  out.c = color(25);
  return out;
}
