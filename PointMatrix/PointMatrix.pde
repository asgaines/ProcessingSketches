float dt = 0;
int numDots = 300;
float maxWeight = 5; // Maximum width of dot
float maxDepth = 200; // Maximum z value of dot
float maxWidth = 2; // Maximum line width
float maxDist = 100; // Distance between dots for which line will be drawn to join
boolean dark = true;
Dot dots[] = new Dot[numDots];

void setup() {
  fullScreen();
  for (int i = 0; i < numDots; i++) {
    dots[i] = new Dot();
  }
}

void draw() {
  background(dark ? 0 : 255);
  
  for (int i = 0; i < numDots; i++) {
    // Loop through every dot in array after one currently being manipulated 
    for (int j = i + 1; j < numDots; j++) {
      float d = distance(dots[i], dots[j]);
      if (d < maxDist) {
        // Width of line between dots determined based on average distance
        // between dots and screen
        strokeWeight(map((dots[i].z + dots[j].z) / 2.0, 0, maxDepth, 0.4, maxWidth));
        // Color determined by distance between dots and dot distance from screen
        stroke(map(d, 0, maxDepth, 100, 255), map(dots[i].z, 0, maxDepth, 70, 255), map(dots[j].z, 0, maxDepth, 70, 255));
        line(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
      }
    }
    dots[i].show();
    dots[i].update();
  }
  dt += 0.01;
}

float distance(Dot dot1, Dot dot2) {
  // Return distance between two dots
  float dX = dot1.x - dot2.x;
  float dY = dot1.y - dot2.y;
  float dZ = dot1.z - dot2.z;
  return sqrt(pow(dX, 2) + pow(dY, 2) + pow(dZ, 2)); //<>//
}

void mouseClicked() {
  // Toggle screen background with mouse click
  dark = !dark;
}

  