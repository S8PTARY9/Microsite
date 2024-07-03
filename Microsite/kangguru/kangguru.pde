PImage img;
PImage[] kangguru = new PImage[8];
PImage[] orang = new PImage[8];
PImage[] matahari = new PImage[2];

int kangguruX = 1000; // Start from the right edge
float kangguruScale = 0.5; // Variable to control kangaroo's scale
int orangX = 1100; // Posisi awal orang di belakang kanguru
int matahariFrame = 0; // Frame untuk animasi matahari


void setup() {
  size(1000, 600); 
  smooth();
  img = loadImage("background padang pasir.jpg");
  kangguru[0] = loadImage("kangguru01.gif");
  kangguru[1] = loadImage("kangguru02.gif");
  kangguru[2] = loadImage("kangguru03.gif");
  kangguru[3] = loadImage("kangguru04.gif");
  kangguru[4] = loadImage("kangguru05.gif");
  kangguru[5] = loadImage("kangguru06.gif"); 
  kangguru[6] = loadImage("kangguru07.gif");
  kangguru[7] = loadImage("kangguru08.gif");
  
  //orang
  orang[0] = loadImage("orang1.gif");
  orang[1] = loadImage("orang2.gif");
  orang[2] = loadImage("orang3.gif");
  orang[3] = loadImage("orang4.gif");
  orang[4] = loadImage("orang5.gif");
  orang[5] = loadImage("orang6.gif"); 
  orang[6] = loadImage("orang7.gif");
  orang[7] = loadImage("orang8.gif");
  
  //matahari
  matahari[0] = loadImage("matahari1.gif");
  matahari[1] = loadImage("matahari2.gif");
}

void draw() {
  image(img, 0, 0, width, height);
  
  // Gambar matahari di atas
  image(matahari[matahariFrame], 500, 30, 270, 170);
  if (frameCount % 7 == 0) { // Ganti frame matahari setiap 7 frame
    matahariFrame = (matahariFrame + 1) % 2;
  }
  
  // Gambar orang di belakang kanguru
  image(orang[frameCount % 8], orangX, 350, 100, 150);
  
  // Gambar kanguru
  pushMatrix();
  scale(kangguruScale);
  image(kangguru[frameCount % 8], kangguruX / kangguruScale, 380 / kangguruScale);
  popMatrix();
  
  // Pergerakan kanguru
  kangguruX -= 4;
  if (kangguruX < -200) {
    kangguruX = width;
  }
  
  // Pergerakan orang
  orangX -= 3; // Bergerak dengan kecepatan yang sama dengan kanguru
  if (orangX < -250) {
    orangX = width + 130; // Reset posisi orang sedikit di belakang kanguru
  }
}
