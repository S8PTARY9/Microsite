import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

float seed, t, radius, mySize;
int num;
PVector[] v_planet;
color[] color_setup2;
color color_bg;

JFrame frame;
JButton closeButton;

void setup() {
  size(1000, 1000, P3D);
  mySize = min(height, width);
  seed = random(1);
  randomSeed(int(seed));
  
  color_setup2 = generateColorPalette();
  color_bg = #202020;
  
  num = int(random(10, 30));
  radius = mySize * 0.35;
  v_planet = new PVector[num];
  for (int i = 0; i < num; i++) {
    v_planet[i] = new PVector();
  }
  t = 0;
  
  // Setup JFrame and close button
  frame = new JFrame();
  closeButton = new JButton("Close");
  closeButton.setBounds(10, 10, 80, 30);
  closeButton.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      frame.dispose();
      exit();
    }
  });
  frame.add(closeButton);
  frame.setSize(200, 200);
  frame.setLayout(null);
  frame.setVisible(true);
}

void draw() {
  background(0);
  
  translate(width/2, height/2, 0);
  
  for (int i = 0; i < num; i++) {
    float a = (TWO_PI / num) * i;
    v_planet[i].set(PVector.fromAngle(a + t).mult(radius / random(3, 5)));
  }
  
  pushMatrix();
  for (float q = 0; q < 0.2; q += random(0.02, 0.04)) {
    rotateXYZ(q);
    drawShapes();
  }
  popMatrix();
  
  t += random(0.001, 0.005);
}

void rotateXYZ(float q) {
  rotateX(random(TWO_PI) + sin(-t) / 5 + q);
  rotateY(random(TWO_PI) + cos(t) / 5 + q);
  rotateZ(random(TWO_PI) + sin(-t) / 5 + q);
}

void drawShapes() {
  noStroke();
  fill(randomColor());
  for (int i = 0; i < num; i += 8) {
    pushMatrix();
    rotateXYZ(t);
    float z_plus = random(-radius/2, radius/2);
    torus(z_plus, random(1, 5), 50, 50);
    popMatrix();
  }
  
  for (int i = 0; i < num; i += 4) {
    pushMatrix();
    PVector pos = v_planet[i].copy().add(PVector.random3D().mult(radius/4));
    translate(pos.x, pos.y, pos.z);
    rotateXYZ(t);
    stroke(randomColor());
    strokeWeight(random(0.5, 2));
    noFill();
    sphere(random(6, 18));
    popMatrix();
  }
}

color randomColor() {
  return color_setup2[int(random(color_setup2.length))];
}

color[] generateColorPalette() {
  String[] palettes = {
    "ffffff-171F26-4A5259-7B848C-AEB7BF",
    "D94389-4D578C-3791A6-3DF2D1-F28080",
    "F28D35-D96A29-A66641-D9B0A7-F2DAD8",
    "F2A7D8-473959-655A8C-9F8FD9-5979D9",
    "025951-012623-21BF92-73D9BC-0D0D0D"
  };
  color[] colors = parseColors(palettes[int(random(palettes.length))]);
  if (colors.length == 0) {
    colors = new color[]{#FFFFFF, #000000};
  }
  return colors;
}

color[] parseColors(String colorString) {
  String[] colorHexes = split(colorString, '-');
  color[] colors = new color[colorHexes.length];
  for (int i = 0; i < colorHexes.length; i++) {
    colors[i] = unhex("FF" + colorHexes[i]);
  }
  return colors;
}

void torus(float r1, float r2, int detailX, int detailY) {
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= detailY; i++) {
    float phi = TWO_PI * i / detailY;
    for (int j = 0; j <= detailX; j++) {
      float theta = TWO_PI * j / detailX;
      float x = (r1 + r2 * cos(phi)) * cos(theta);
      float y = (r1 + r2 * cos(phi)) * sin(theta);
      float z = r2 * sin(phi);
      vertex(x, y, z);
      
      float x2 = (r1 + r2 * cos(phi + TWO_PI / detailY)) * cos(theta);
      float y2 = (r1 + r2 * cos(phi + TWO_PI / detailY)) * sin(theta);
      float z2 = r2 * sin(phi + TWO_PI / detailY);
      vertex(x2, y2, z2);
    }
  }
  endShape();
}

void mousePressed() {
  seed = random(1);
  num = int(random(10, 30));
  color_setup2 = generateColorPalette();
  v_planet = new PVector[num];
  for (int i = 0; i < num; i++) {
    v_planet[i] = new PVector();
  }
  radius = mySize * 0.35;
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("Emotional_lines_####.png");
  }
}
