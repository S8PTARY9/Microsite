Eye e1, e2, e3;

void setup() {
  size(1000, 1000);
  noStroke();  
  e3 = new Eye( 500, 300, 100);
}

void draw() {
  background(102);
  e3.update(mouseX, mouseY);
  e3.display();
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    fill(0, 255, 0); // hijau
  rect(400, 200, 200, 400, 20); // (x, y, lebar, tinggi, radius)
  // antena
  fill(0, 255, 0); // hijau
  rect(400, 100, 30, 200, 20); // (x, y, lebar, tinggi, radius)
  rect(570, 100, 30, 200, 20); // (x, y, lebar, tinggi, radius)
  // tangan
   fill(0, 255, 0); // hijau
  rect(603, 350, 30, 200, 60); // (x, y, lebar, tinggi, radius)
  rect(367, 350, 30, 200, 60); // (x, y, lebar, tinggi, radius)
  // kaki
   fill(0, 255, 0); // hijau
  rect(430, 470, 30, 200, 20); // (x, y, lebar, tinggi, radius)
  rect(540, 470, 30, 200, 20); // (x, y, lebar, tinggi, radius)
  // alis
   fill(0); // hitam
  rect(465, 210, 75, 30, 20); // (x, y, lebar, tinggi, radius)
  // mulut
   fill(150,10,0); // merah
    arc(500,400, 100, 100, 0, PI);
  pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0, 0, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}
