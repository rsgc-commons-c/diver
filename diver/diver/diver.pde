//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark
int total = 100;
int u=0;//u can be equal to anything for us
int diameter = 0;//for the circle
float[] x = new float[total];//now we have 10 programmable values for x
float[] y = new float[total];//now we have 10 programmable values for y
int[] xflip = new int[total];// now we have the possibility to flip the sharks to go back across the screen
int[] yflip = new int[total];//this lets the sharks come back on a different path
float xPlayer = 0;
float yPlayer = 0;
PImage image;
/*this is a 
 u = 0
 x[1] = 0
 x[2] = 0
 x[3]
 */

void setup() {
  
  //createcanvas
  size(600, 700);
  image = loadImage ("free_underwater_background_psd_by_sorbamedia-d7p6xw7.jpg");
  colorMode(HSB, 360, 100, 100);
  //generate the obstacles (sharks) + makes them move
  while ( u < x.length) {
    x[u] = random(width);
    y[u] = random(height -15);
    xflip[u] = 1;
    yflip[u] = 1;
    if (u%2 == 0) {
      xflip[u] = -1;
    }
    u = u+1;
  }
}

void draw() {

  //background colour
  background(image);
  

  //player
  drawDiver(xPlayer, yPlayer);

  //arrow key commands
  if (keyPressed) {
    if (keyCode == UP) {
      yPlayer = yPlayer - 1;
      if(yPlayer < 0){
        yPlayer = 0;
      }
    }
    if (keyCode == DOWN) {
      yPlayer = yPlayer + 1;
      if(yPlayer > height){
      yPlayer = height;
    } 
    }
    if (keyCode == LEFT) {
      xPlayer = xPlayer - 1;
      if(xPlayer < 0){
        xPlayer = width;
    }
    }
    if (keyCode == RIGHT) {
      xPlayer = xPlayer + 1;
      if(xPlayer > width){
        xPlayer = 0;
    }
    }
  }

  //makes for the bouncing off the walls
  for (int u = 0; u < x.length; u = u+1) {
    rect(x[u], y[u], 10, 10);
    x[u] = x[u]+1 * xflip[u];

    if (x[u] > width + 3) {
      xflip[u] = -1;
      y[u] = y[u] + random(-100, 100);
    }

    if (x[u]<0) {
      xflip[u]= 1;
      y[u] = y[u] + random(-100, 100);
    }
    //makes sure the obstacles don't go out of bounds & randomly generate
    if (y[u] > 700||y[u] < 0) {
      y[u] = random(0, height - 15);
      x[u] = random(0, width);
    } 
    //dangerous targets - work in progress

    if (xPlayer > x[u] && xPlayer < x[u] +10 && yPlayer > y[u] && yPlayer < y[u]+10) {
      xPlayer = 0;
      yPlayer = 0;
    }

    //coordinates
    textSize(10);
    fill(0, 0, 0);
    text("X is: " + xPlayer, xPlayer, yPlayer);
    text("Y is: " + yPlayer, xPlayer, yPlayer +10);
    noStroke();
  }
} 

void drawDiver(float latitude, float longitute){
  pushMatrix();
  translate(latitude, longitute);
  ellipse(0, 0, 10, 10);
  popMatrix();
}
