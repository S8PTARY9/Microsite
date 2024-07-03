void setup() {
  size(700, 1000);
  background(255);
}

void draw() {
  background(255);

  // Center the monitor
  int monitorX = width / 2 - 125; // Adjusted X coordinate
  int monitorY = 200; // Adjusted Y coordinate to move it upwards

  // Monitor base
  fill(0, 0, 0); // Black color
  strokeWeight(5);
  rect(monitorX, monitorY, 250, 200); // Monitor body

  // Screen display
  fill(128,128,128); // Abu2 color
  rect(monitorX + 10, monitorY + 10, 230, 180); // Inner screen


  // Display text
  fill(0); // Black color
  textSize(40);
  text("SEPTA", monitorX + 70, monitorY + 100); // Text on screen

  // Monitor stand
  fill(0, 0, 0); // Black color
  triangle(monitorX + 125, monitorY + 220, monitorX + 70, monitorY + 270, monitorX + 180, monitorY + 270); // Triangular stand

  // Box on top of the triangular stand
  rect(monitorX + 110, monitorY + 200, 30, 40); // Box

  // Keyboard base
  int keyboardX = monitorX;
  int keyboardY = monitorY + 280; // Positioned below the monitor
  rect(keyboardX, keyboardY, 250, 70); // Base

  // Keyboard keys
  fill(255); // Darker blue for keys
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 10; j++) {
      rect(keyboardX + 17 + j * 22, keyboardY + 7 + i * 10, 17, 10); // Keys
    }
  }

  // Mouse
  fill(0, 0,150); // Blue color for mouse
  ellipse(keyboardX + 300, keyboardY + 35, 40, 60); // Mouse body
  fill(0,0,0); // black color for mouse button
  ellipse(keyboardX + 300, keyboardY + 35, 20, 30); // Mouse button

  // CPU case
  int cpuX = monitorX + 270; // Positioned to the right of the monitor
  int cpuY = monitorY + 70;
  rect(cpuX, cpuY, 70, 200); // CPU case
  fill(255); // white color for the power button
  ellipse(cpuX + 35, cpuY + 180, 20, 20); // Power button
  rect(cpuX + 15, cpuY + 130, 40, 10); // filter
  rect(cpuX + 10, cpuY + 20, 50, -10); // dvd
}
