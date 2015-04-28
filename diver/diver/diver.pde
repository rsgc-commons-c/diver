//Welcome to my game of diver, the 
//objective of the game is to try and
//get the treasure without hitting the
//shark

int u=0;//u can be equal to anything for us
int diameter = 0;//for the circle
float[] x = new float[40];//now we have 10 programmable values for x
float[] y = new float[40];//now we have 10 programmable values for y
int[] xflip = new int[40];// now we have the possibility to flip the sharks to go back across the screen
int[] yflip = new int[40];//this lets the sharks come back on a different path
float xPlayer = 0;
float yPlayer = 0;
/*this is a 
 u = 0
 x[1] = 0
 x[2] = 0
 x[3]
 */

void setup() {
  //createcanvas
  size(400, 700);
  colorMode(HSB, 360, 100, 100);
  //generate the obstacles (sharks) + makes them move
  while ( u < 40) {
    x[u] = random(width);
    y[u] = random(height);
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
  background(184, 70, 100);

  //player
  ellipse(xPlayer, yPlayer, 10, 10);

  //arrow key commands
  if (keyPressed) {
    if (keyCode == UP) {
      yPlayer = yPlayer - 5;
    }
    if (keyCode == DOWN) {
      yPlayer = yPlayer + 5;
    } 
    if (keyCode == LEFT) {
      xPlayer = xPlayer - 5;
    }
    if (keyCode == RIGHT) {
      xPlayer = xPlayer + 5;
    }
  }

  //makes for the bouncing off the walls
  for (int u = 0; u < x.length; u = u+1) {
    rect(x[u], y[u], 10, 10);
    x[u] = x[u]+1 * xflip[u];

    if (x[u] > width) {
      xflip[u] = -1;
      y[u] = y[u] + random(-100, 100);
    }
    
    if (x[u]<0) {
      xflip[u]= 1;
      y[u] = y[u] + random(-100, 100);
    }
    //makes sure the obstacles don't go out of bounds
    if (y[u] > 700||y[u] < 0) {
      y[u] = random(0, height);
      x[u] = random(0, width);
      ellipse (x[u], y[u], 50, 50);//just shows where random square is
    } 
    //dangerous targets - work in progress
    float a = mouseX - x[u]; // horizontal leg of the triangle
    float b =  mouseY - y[u]; // vertical leg of the triangle
    float c = sqrt( a*a + b*b ); // Use Pythagorean theorem to get hypotenuse length (sq. root of a^2 + b^2)
    if ( c <= diameter/2 && mousePressed) {
      ellipse(10, 10, 10, 10);
    }

    //coordinates
    textSize(10);
    fill(0, 0, 0);
    text("X is: " + mouseX, mouseX, mouseY);
    text("Y is: " + mouseY, mouseX, mouseY +10);
    noStroke();
  }
} 
