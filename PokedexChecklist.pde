final int BOX_WIDTH = 6, BOX_HEIGHT = 5;
final int SPRITE_WIDTH = 80, SPRITE_HEIGHT = 80;
final int DEX_LENGTH = 493;
final color[] COLOUR = {#FFFFFF, #FF0000, #00FF00, #0000FF, #000000};

final int BOX_SIZE = BOX_WIDTH*BOX_HEIGHT, SPRITE_SIZE = SPRITE_WIDTH*SPRITE_HEIGHT;
final int SCREEN_WIDTH = BOX_WIDTH*SPRITE_WIDTH, SCREEN_HEIGHT = BOX_HEIGHT*SPRITE_HEIGHT;
final int BOX_LENGTH = ceil(float(DEX_LENGTH)/BOX_SIZE), BOX_DIGITS = floor(log(DEX_LENGTH)/log(10)+1);

PImage[] img = new PImage[DEX_LENGTH];
int[] index = new int[DEX_LENGTH];
int off = 0;

void settings() {
  size(SCREEN_WIDTH+1,SCREEN_HEIGHT+SPRITE_HEIGHT+1);
}

void setup() {
  String[] s = loadStrings("checklist.txt");
  if (s == null) {
    for (int i = 0; i < DEX_LENGTH; ++i) {
      img[i] = loadImage(nf(i+1, BOX_DIGITS)+".png");
      index[i] = 0;
    }
    off = 0;
  } else {
    for (int i = 0; i < DEX_LENGTH; ++i) {
      img[i] = loadImage(nf(i+1, BOX_DIGITS)+".png");
      index[i] = int(s[i]);
    }
    off = int(s[DEX_LENGTH]);
  }
  textAlign(CENTER, CENTER);
  textSize(SPRITE_SIZE/100);
}

void draw() {
  for (int i = 0; i < BOX_SIZE; ++i) {
    int x = (i%BOX_WIDTH)*SPRITE_WIDTH, y = (i/BOX_WIDTH)*SPRITE_HEIGHT, z = BOX_SIZE*off+i;
    if (z >= DEX_LENGTH) {
      fill(COLOUR[COLOUR.length-1]);
      rect(x, y, SPRITE_WIDTH, SPRITE_HEIGHT);
    } else {
      fill(COLOUR[index[z]]);
      rect(x, y, SPRITE_WIDTH, SPRITE_HEIGHT);
      image(img[z], x, y, SPRITE_WIDTH, SPRITE_HEIGHT);
    }
  }
  fill(COLOUR[0]);
  rect(0, SCREEN_HEIGHT, SPRITE_WIDTH*2, SPRITE_HEIGHT);
  rect(SPRITE_WIDTH*2, SCREEN_HEIGHT, SPRITE_WIDTH*(BOX_WIDTH-4), SPRITE_HEIGHT);
  rect(SPRITE_WIDTH*(BOX_WIDTH-2), SCREEN_HEIGHT, SPRITE_WIDTH*2, SPRITE_HEIGHT);
  fill(COLOUR[COLOUR.length-1]);
  text("<<", 0, SCREEN_HEIGHT, SPRITE_WIDTH*2, SPRITE_HEIGHT);
  text("SAVE", SPRITE_WIDTH*2, SCREEN_HEIGHT, SPRITE_WIDTH*(BOX_WIDTH-4), SPRITE_HEIGHT);
  text(">>", SPRITE_WIDTH*(BOX_WIDTH-2), SCREEN_HEIGHT, SPRITE_WIDTH*2, SPRITE_HEIGHT);
}

void mousePressed() {
  int x = mouseX/SPRITE_WIDTH, y = mouseY/SPRITE_HEIGHT, z = BOX_SIZE*off+y*BOX_WIDTH+x;
  if (y == BOX_HEIGHT) {
    if (x > BOX_WIDTH-3) off = (off+BOX_LENGTH+1)%BOX_LENGTH;
    else if (x < 2) off = (off+BOX_LENGTH-1)%BOX_LENGTH;
    else saveDex();
  } else if (z < DEX_LENGTH) {
    if (mouseButton == LEFT) index[z] = (index[z]+COLOUR.length+1)%COLOUR.length;
    else index[z] = (index[z]+COLOUR.length-1)%COLOUR.length;
  }
}

void saveDex() {
  String[] s = new String[DEX_LENGTH+1];
  for (int i = 0; i < DEX_LENGTH; ++i) {
    s[i] = str(index[i]);
  }
  s[DEX_LENGTH] = str(off);
  saveStrings("checklist.txt", s);
}

void exit() {
  saveDex();
  super.exit();
}
