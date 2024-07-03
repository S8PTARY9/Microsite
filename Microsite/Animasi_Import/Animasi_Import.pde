PImage img;
PImage[] Leonie = new PImage[15];
PImage[] Naya = new PImage[12];
PImage[] Sun = new PImage[3];

int LeonieX = 1000; // Start from the right edge
float LeonieScale = 0.5; // Variable to control Leonie scale
int NayaX = 2700; // Posisi awal Naya di belakang Leonie
int SunFrame = 0; // Frame untuk animasi Sun


void setup() {
  size(1000, 600); 
  smooth();
  img = loadImage("Jalan Perkotaan.jpeg");
  Leonie[0] = loadImage("Leonie1.gif");
  Leonie[1] = loadImage("Leonie2.gif");
  Leonie[2] = loadImage("Leonie3.gif");
  Leonie[3] = loadImage("Leonie4.gif");
  Leonie[4] = loadImage("Leonie5.gif");
  Leonie[5] = loadImage("Leonie6.gif"); 
  Leonie[6] = loadImage("Leonie7.gif");
  Leonie[7] = loadImage("Leonie8.gif");
  Leonie[1] = loadImage("Leonie9.gif");
  Leonie[2] = loadImage("Leonie10.gif");
  Leonie[3] = loadImage("Leonie11.gif");
  Leonie[4] = loadImage("Leonie12.gif");
  Leonie[5] = loadImage("Leonie13.gif"); 
  Leonie[6] = loadImage("Leonie14.gif");
  Leonie[7] = loadImage("Leonie15.gif");
  
  //Naya
  Naya[0] = loadImage("Naya1.gif");
  Naya[1] = loadImage("Naya2.gif");
  Naya[2] = loadImage("Naya3.gif");
  Naya[3] = loadImage("Naya4.gif");
  Naya[4] = loadImage("Naya5.gif");
  Naya[5] = loadImage("Naya6.gif"); 
  Naya[6] = loadImage("Naya7.gif");
  Naya[7] = loadImage("Naya8.gif");
  Naya[4] = loadImage("Naya9.gif");
  Naya[5] = loadImage("Naya10.gif"); 
  Naya[6] = loadImage("Naya11.gif");
  Naya[7] = loadImage("Naya12.gif");
  
  //matahari
  Sun[0] = loadImage("Sun1.gif");
  Sun[1] = loadImage("Sun2.gif");
  Sun[1] = loadImage("Sun3.gif");
}

void draw() {
  image(img, 0, 0, width, height);
  
  // Gambar Sun di atas
  image(Sun[SunFrame], 500, 30, 270, 170);
  if (frameCount % 7 == 0) { // Ganti frame Sun setiap 7 frame
    SunFrame = (SunFrame + 1) % 2;
  }
  
   // Gambar Naya di belakang Leonie dan pada jalan
  image(Naya[frameCount % 8], NayaX, 380, 370, 200); // Adjusted Y position to 450
  
  // Gambar Leonie
  pushMatrix();
  scale(LeonieScale);
  image(Leonie[frameCount % 8], LeonieX / LeonieScale, 400 / LeonieScale);
  popMatrix();
  
  // Pergerakan Leonie (kiri ke kanan)
  LeonieX += 4;
  if (LeonieX > width) {
    LeonieX = -200;
  }
  
  // Pergerakan Naya (kiri ke kanan)
  NayaX += 3; // Bergerak dengan kecepatan yang sedikit lebih lambat dari Leonie
  if (NayaX > width) {
    NayaX = -300; // Reset posisi Naya sedikit di belakang Leonie
  }
}
