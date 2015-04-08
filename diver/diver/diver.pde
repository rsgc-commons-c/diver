//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark

//createcanvas
void setup() {
  size(400, 700);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  //background
  background(184, 70, 100);

  ellipse(mouseX, mouseY, 10, 10);

  //coordinates
  textSize(10);
  fill(0, 0, 0);
  text("X is: " + mouseX, mouseX, mouseY);
  text("Y is: " + mouseY, mouseX, mouseY +10);
  noStroke();
}
