//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark
int total = 65;
int u=0;//u can be equal to anything for us
int a=0;
int diameter = 0;//for the circle
float[] x = new float[total];//now we have 10 programmable values for x
float[] y = new float[total];//now we have 10 programmable values for y
int [] speed = new int [total];
float xPlayer = 0;
float yPlayer = 0;
PImage image;
PImage hook;
float[] bubbleX = new float[5];
float[] bubbleY = new float[5];
int b = 0;


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
  u = 0;

  while ( u < x.length) {
    x[u] = random(width);
    y[u] = random(height);
    speed [b] = 1;
    if (u%2 == 0) {
      speed[b] = -1;
    }
    u = u+1;
  }
  for (int wlongg = 0; wlongg<x.length; wlongg = wlongg+1) { 
    if (wlongg%2==0) {
      speed[wlongg] = 1;
    } else {
      speed[wlongg] = -1;
    }
  }
}

void draw() {
  fill(0, 0, 0);

  //background colour
  background(image);

  //player
  drawHook(xPlayer, yPlayer);
  ellipse(14, 23, 5, 5);

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


  for (int b = 0; b < x.length; b++) {

    createShark(x[b], y[b]);// dra w an instance of this shark at this x, y position
    x[b] = x[b] + speed[b];

    println(b + "/" + speed[b]);
    // move shark horizontally





    //makes for the bouncing off the walls

    if (x[b] > width) {
      x[b] = width;
      speed[b] = -1;
      y[b] = y[b] + random(-100, 100);
    }

    if (x[b]<0) {
      x[b] = 0;
      speed[b]= 1;
      y[b] = y[b] + random(-100, 100);
    }
    //makes sure the obstacles don't go out of bounds & randomly generate
    if (y[b] > height ||y[b] < 0) {
      y[b] = random(0, height - 15);
      x[b] = random(0, width);
    } 
    //dangerous targets - work in progress

    if (xPlayer > x[b] && xPlayer < x[b] +10 && yPlayer > y[b] && yPlayer < y[b]+10) {
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

void drawHook(float latitude, float longitute) {
  pushMatrix();
  translate(latitude, longitute);
  scale(.1, .1);
  image(hook, 0, 0);
  popMatrix();
}

void createShark(float x, float y) {

  // note to self: make x, y values relative to 0, 0

  pushMatrix();
  translate(x, y);
  ellipse(30, 16, 32, 14);
  fill(360, 100, 100);
  ellipse(39, 15, 4, 4);
  fill(0, 0, 0);
  triangle(22, 33, 36, 23, 22, 24);
  triangle(16, 17, 6, 26, 7, 7);
  triangle(24, 1, 37, 12, 19, 16);
  fill(360, 100, 284);
  rect(28, 11, 1, 10);
  rect(30, 11, 1, 10);
  rect(26, 11, 1, 10);
  popMatrix();
}
