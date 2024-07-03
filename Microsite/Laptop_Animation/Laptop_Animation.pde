float angleX = 0;
float angleY = 0;
PImage wallpaper;

void setup() {
  size(700, 700, P3D); // 3D canvas
  background(255);
  wallpaper = createImage(230, 130, RGB);
  createWallpaper();
}

void draw() {
  background(255); // Clear the background
  lights(); // Add some lighting
  translate(width / 2, height / 2, 0); // Move the origin to the center of the canvas
  
  // Map the mouse position to rotation angles
  angleX = map(mouseY, 0, height, -PI/4, PI/4); // Rotate around X-axis (limited range)
  angleY = map(mouseX, 0, width, -PI, PI); // Rotate around Y-axis
  
  rotateX(angleX); // Apply X-axis rotation
  rotateY(angleY); // Apply Y-axis rotation
  
  drawLaptop();
}

void drawLaptop() {
  pushMatrix();
  translate(0, 20, 0); // Move the entire laptop slightly up
  
  // Laptop base (keyboard part)
  fill(0, 0, 255); // Blue color
  stroke(0); // Black stroke
  pushMatrix();
  translate(0, 0, 0);
  box(250, 10, 160); // Base (increased height)
  popMatrix();
  
  // Touchpad
  fill(0, 0, 150); // Darker blue for touchpad
  pushMatrix();
  translate(0, -7, 40); // Adjust position to sit on top of base
  box(50, 1, 30); // Touchpad
  popMatrix();
  
  // Keyboard keys
  fill(0, 0, 150); // Darker blue for keys
  for (int i = -4; i <= 4; i++) {
    for (int j = -2; j <= 2; j++) {
      pushMatrix();
      translate(i * 22, -7, j * 18 - 27); // Adjust position to sit on top of base
      box(27, 3, 10); // Keys
      popMatrix();
    }
  }
  
  // Laptop screen
  fill(0, 0, 255); // Blue color
  pushMatrix();
  translate(0, -75, -83); // Adjusted position
  rotateX(-PI / 130); // Tilt the screen back
  box(250, 150, 10); // Screen body
  popMatrix();
  
  // Screen display with wallpaper
  pushMatrix();
  translate(0, -72, -78); // Adjusted position
  rotateX(-PI / 130); // Tilt the screen back
  fill(255);
  box(230, 130, 1); // Inner screen
  translate(0, 0, 0.6);
  rotateX(PI);
  image(wallpaper, -115, -65, 230, 130);
  popMatrix();
  
  // Add ports
  fill(50); // Dark gray color for ports
  
  // Left side ports
  pushMatrix();
  translate(-100, 0, 0); // Move to the left side of the laptop
  rotateY(PI/2); // Rotate to face outward
  
  // USB ports
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(0, 0, i * 20 - 30);
    box(10, 5, 15);
    popMatrix();
  }
  
  popMatrix();
  
  popMatrix(); // End of entire laptop transformation
}

void createWallpaper() {
  wallpaper.loadPixels();
  for (int i = 0; i < wallpaper.pixels.length; i++) {
    float r = random(100, 200);
    float g = random(100, 200);
    float b = random(200, 255);
    wallpaper.pixels[i] = color(r, g, b);
  }
  wallpaper.updatePixels();
}
