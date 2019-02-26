float lastMouseX;
float lastMouseY;
float thickness;

final float MAX_THICKNESS = 30;

void setup() {
  size(1200, 800);
  lastMouseX = mouseX;
  lastMouseY = mouseY;
  thickness = MAX_THICKNESS;
  background(255);
}

void draw() {
  noStroke();
  fill(0);

  if (mousePressed) {
    float xDifference = mouseX - lastMouseX;
    float yDifference = mouseY - lastMouseY;
    float distance = Math.abs(dist(mouseX, mouseY, lastMouseX, lastMouseY));

    for (int i = 1; i <= 200; i++) {
      float x = xDifference / 200 * i + lastMouseX;
      float y = yDifference / 200 * i + lastMouseY;

      thickness += ((1 / distance * 500) - thickness) / 200;
      if (thickness > MAX_THICKNESS) {
        thickness = MAX_THICKNESS;
      }
      circle(x, y, thickness);
    }
  }

  lastMouseX = mouseX;
  lastMouseY = mouseY;
}

void mouseReleased() {
  thickness = MAX_THICKNESS;
}

void keyPressed() {
  if (key == 'c') {
    background(255);
  }
}
