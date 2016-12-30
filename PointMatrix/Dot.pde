class Dot {
  float x;
  float y;
  float z;
  float z0; // Initial offset of z
  float mX;
  float mY;  
  
  Dot() {
    x = random(width);
    y = random(height);
    z0 = random(maxDepth);
    
    // Slope of dot trajectory
    mX = random(-2, 2);
    mY = random(-2, 2);
  }
  
  void show() {
    // Width of dot determined by distance from screen
    strokeWeight(map(z, 0, maxDepth, 1, maxWeight));
    stroke(100);
    point(x, y);
  }
  
  void update() {
    // Move dot along initialized trajectory
    x += mX;
    y += mY;
    
    // Oscillate z value between 0 and maxDepth
    z = sin(dt + z0) * maxDepth / 2.0 + maxDepth / 2.0;
    
    // Confine dot to screen. Favored over modulus technique.
    if (x < 0) {
      x += width;
    } else if (x > width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y > height) {
      y -= height;
    }
  }
}