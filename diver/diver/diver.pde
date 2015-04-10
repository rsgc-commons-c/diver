//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark

int u=0;
float[] x = new float[100];
float[] y = new float [100];

//createcanvas
void setup() {

  size(400, 700);
  colorMode(HSB, 360, 100, 100);
  while ( u <x.length ) {
    x[u] = random(width);
    u += 1;
  }
}


void draw() {
  //background
  background(184, 70, 100);

  ellipse(mouseX, mouseY, 10, 10);

  for (int u = 0; u < x.length; u++) {
    rect(x[u], y[u], 10, 10);
  }

  //coordinates
  textSize(10);
  fill(0, 0, 0);
  text("X is: " + mouseX, mouseX, mouseY);
  text("Y is: " + mouseY, mouseX, mouseY +10);
  noStroke();
}
