//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark

int u=0;//u can be equal to anything for us
float[] x = new float[10];//now we have 10 programmable values for x
float[] y = new float[10];//now we have 10 programmable values for y
int[] xflip = new int[10];// now we have the possibility to flip the sharks to go back across the screen 
/*this is a 
 u = 0
 x[1] = 0
 x[2] = 0
 x[3]
 */
//createcanvas
void setup() {

  size(400, 700);
  colorMode(HSB, 360, 100, 100);
  while ( u < x.length/2 + y.length/2) {
    x[u] = random(width);
    y[u] = random(height);
    xflip[u] = 1;
    u = u+1;
  }
}

void draw() {
  //background
  background(184, 70, 100);

  ellipse(mouseX, mouseY, 10, 10);

  for (int u = 0; u < x.length; u = u+1) {
    rect(x[u], y[u], 10, 10);
    x[u] = x[u]+1 * xflip[u];
    if (x[u] > width) {
      xflip[u] = -1;
    }
    if (x[u]<0){
      xflip[u]= 1;
    }
  }

  //coordinates
  textSize(10);
  fill(0, 0, 0);
  text("X is: " + mouseX, mouseX, mouseY);
  text("Y is: " + mouseY, mouseX, mouseY +10);
  noStroke();
}
