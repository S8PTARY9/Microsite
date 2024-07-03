void setup() {
  size(700, 1000);
  background(255);
}

void draw() {
  background(255);
  // Center the laptop
  int laptopX = width / 2 - 125; // Adjusted X coordinate
  int laptopY = 300; // Adjusted Y coordinate to move it upwards
  
  // Laptop screen
  fill(0, 0, 255); // Blue color
  strokeWeight(4);
  rect(laptopX, laptopY, 250, 170); // Screen body
  
  // Screen display
  fill(255); // White color
  rect(laptopX + 10, laptopY + 10, 230, 150); // Inner screen
  
  // Landscape wallpaper
  drawWallpaper(laptopX + 10, laptopY + 10);
  
  // Laptop base (keyboard part)
  fill(0, 0, 255); // Blue color
  quad(laptopX, laptopY + 170, 
       laptopX + 250, laptopY + 170, 
       laptopX + 270, laptopY + 300, 
       laptopX - 20, laptopY + 300); // Base with perspective
  
  // Keyboard keys
  fill(150, 75, 0); // Darker blue for keys
  int rows = 6;
  int cols = 12;
  float keyWidth = 17;
  float keyHeight = 12;
  float keyboardStartX = laptopX + 4;
  float keyboardStartY = laptopY + 178;
  float keyboardEndX = laptopX + 230;
  float keyboardEndY = laptopY + 240;

  for (int i = 0; i < rows; i++) {
    float rowStartX = map(i, 0, rows - 1, keyboardStartX, keyboardStartX - 10);
    float rowEndX = map(i, 0, rows - 1, keyboardEndX, keyboardEndX + 10);
    float rowY = map(i, 0, rows - 1, keyboardStartY, keyboardEndY);
    
    for (int j = 0; j < cols; j++) {
      float keyX = map(j, 0, cols - 1, rowStartX, rowEndX);
      float perspectiveOffset = map(i, 0, rows - 0, 0, 0);
      
      quad(keyX, rowY,
           keyX + keyWidth, rowY,
           keyX + keyWidth + perspectiveOffset, rowY + keyHeight,
           keyX + perspectiveOffset, rowY + keyHeight);
    }
  }
  
  // Touchpad
  fill(0, 0, 255); // Darker blue for touchpad
  quad(laptopX + 75, laptopY + 267,
       laptopX + 175, laptopY + 267,
       laptopX + 180, laptopY + 287,
       laptopX + 70, laptopY + 287); // Touchpad with perspective
}

void drawWallpaper(int x, int y) {
  // Sky
  fill(135, 206, 235); // Sky blue
  rect(x, y, 230, 90); // Upper half for sky
  
  // Mountains
  fill(34, 139, 34); // Green
  triangle(x + 10, y + 90, x + 70, y, x + 130, y + 90); // Left mountain
  triangle(x + 90, y + 90, x + 150, y + 10, x + 210, y + 90); // Right mountain
  
  // Sun
  fill(255, 223, 0); // Yellow
  ellipse(x + 90, y + 40, 40, 40); // Sun
  
  // Lake
  fill(0, 191, 255); // Lake blue
  ellipse(x + 165, y + 120, 120, 50); // Lake
  
  // Trees
  fill(139, 69, 19); // Brown for tree trunk
  rect(x + 45, y + 30, 20, 80); // Tree trunk 1
  fill(0, 128, 0); // Dark green for tree top
  ellipse(x + 55, y + 50, 50, 50); // Tree top 1
}
