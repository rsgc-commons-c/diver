//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark
int total = 50;
int u=0;//u can be equal to anything for us
int a=0;
int diameter = 0;//for the circle
float[] x = new float[total];//now we have 10 programmable values for x
float[] y = new float[total];//now we have 10 programmable values for y
int[] xflip = new int[total];// now we have the possibility to flip the sharks to go back across the screen
int[] yflip = new int[total];//this lets the sharks come back on a different path
float xPlayer = 0;
float yPlayer = 0;
PImage image;
PImage hook;
float[] bubbleX = new float[5];
float[] bubbleY = new float[5];

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
  hook = loadImage ("158px-Coa_Illustration_Elements_Tool_Hook.svg.png");
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
fill(0, 0, 0);
 
  //background colour
  background(image);



  //bubbles
  for (int w = 0; w<bubbleX.length; w = w+1) { 
    ellipse(bubbleX[w], bubbleY[w], 3, 3);
    bubbleY[w] = bubbleY[w] - random(0.5, 1);
    bubbleX[w] = random(-1, 1)+bubbleX[w];
    if (bubbleY[w] < 0) {
      bubbleY[w] = xPlayer + 30;
      bubbleX[w] = yPlayer - -25;
    }
  }
  //player
  


  //arrow key commands
  if (keyPressed) {
    if (keyCode == UP) {
      yPlayer = yPlayer - 1;
      if (yPlayer < 0) {
        yPlayer = 0;
      }
    }
    if (keyCode == DOWN) {
      yPlayer = yPlayer + 1;
      if (yPlayer > height) {
        yPlayer = height;
      }
    }
    if (keyCode == LEFT) {
      xPlayer = xPlayer - 1;
      if (xPlayer < 0) {
        xPlayer = width;
      }
    }
    if (keyCode == RIGHT) {
      xPlayer = xPlayer + 1;
      if (xPlayer > width) {
        xPlayer = 0;
      }
    }
  }

  //makes for the bouncing off the walls
  for (int u = 0; u < x.length; u = u+1) {
    createShark(x[u] = x[u]+1 * xflip[u]);

    if (x[u] > width + 3) {
      xflip[u] = -1;
      y[u] = y[u] + random(-100, 100);
    }

    if (x[u]<0) {
      xflip[u]= 1;
      y[u] = y[u] + random(-100, 100);
    }
    //makes sure the obstacles don't go out of bounds & randomly generate
    if (y[u] > 700 ||y[u] < 0) {
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
  
  //treasure
  fill(2, 44, 54);
  rect(282, 548, 69, 36);
  fill(63, 63, 62);
  rect(344, 548, 7, 36);
  rect(282, 548, 7, 36);
  rect(286, 548, 60, 7);
  rect(289, 576, 56, 8);
  textSize(11);
  text("treasure", 295, 569);
  
  
} 

void drawDiver(float latitude, float longitute) {
  pushMatrix();
  translate(latitude, longitute);
  scale(.1, .1);
  image(hook, 0, 0);
  popMatrix();
}

void createShark(float x[], float y[]) {
  
 ellipse(309, 38, 34, 14);
  rect(10, 10, 20, 20);
  fill(360, 100, 100);
  ellipse(317, 36, 4, 4);
  ellipse(1, 1, 2, 2);
  fill(0, 0, 0);
  triangle(305, 51, 312, 43 ,299 ,41);
  triangle(294, 37, 285, 46, 282, 26);
  triangle(300, 34, 294, 16, 315, 34);
  fill(360, 100, 284);
  rect(310, 33, 1, 10);
  rect(306, 32, 1, 10);
  rect(302, 32, 1, 10);
}
