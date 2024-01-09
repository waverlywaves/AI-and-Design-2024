int numRipples = 20;   // Number of ripples
ArrayList<Ripple> ripples = new ArrayList<Ripple>(); // ArrayList to store ripple objects

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  
  // Display and update all ripples
  for (int i = ripples.size() - 1; i >= 0; i--) {
    Ripple ripple = ripples.get(i);
    ripple.update();
    ripple.display();
    
    // Remove completed ripples
    if (!ripple.isExpanding()) {
      ripples.remove(i);
    }
  }
}

void mousePressed() {
  for (int i = 0; i < numRipples; i++) {
    // Generate random colors for each ripple
    float randomRed = random(255);
    float randomGreen = random(255);
    float randomBlue = random(255);
    color randomColor = color(randomRed, randomGreen, randomBlue);
    
    ripples.add(new Ripple(mouseX, mouseY, randomColor));
  }
}

class Ripple {
  float x, y;
  float diameter;
  float maxDiameter = 600; // Triple the maximum diameter
  boolean expanding = false;
  color rippleColor;
  
  Ripple(float x, float y, color c) {
    this.x = x;
    this.y = y;
    diameter = 10;
    expanding = true;
    rippleColor = c;
  }
  
  boolean isExpanding() {
    return expanding;
  }
  
  void update() {
    if (expanding) {
      diameter += 5;
      if (diameter >= maxDiameter) {
        expanding = false;
        diameter = 0;
      }
    }
  }
  
  void display() {
    if (expanding) {
      noFill();
      stroke(rippleColor, 100); // Set the stroke color to the randomized color
      ellipse(x, y, diameter, diameter);
    }
  }
}
