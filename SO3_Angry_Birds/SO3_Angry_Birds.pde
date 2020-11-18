float x = 0; // X-koordinatet ved t.
float y = 0; // Y-koordinatet ved t.
float g = 9.81; // Tyngdekraften.
float t; // Tiden bolden har været i luften.
float x0;
float y0; // -800.
float alpha; // PI/4;.
float L; // Længden slangebøssen trækkes.
float A; // Affyringshældning.
float E; // Affyringsenergi.
float m = 1; // Fulgens vægt (kg).
float u0; // Affyringshastighed i x-retningen.
float v0; // Affyringshastighed i y-retningen.

float[] r = new float[2];

boolean mouseR = false; // Det er false, da det ikke sker fra start.
boolean mouseP = false; // Det er false, da det ikke sker fra start.
boolean pulled = false; // Det er false, da det ikke sker fra start.
boolean birdFlying = false; // Det er false, da det ikke sker fra start.
boolean mousePressedFlying = false; // Det er false, da det ikke sker fra start.

void setup() {
  //fullScreen();
  size(1440, 800); // Den tilpassede størrelse til skærmen.
  frameRate(60); // Den viser billedet 60 gange i sekundet.
  rectMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  clear();
  background(255);
  
  text("[R] for reset", 50, 50); // Den tekst som står på skærmen og placeringen.
  text("Alpha: " + alpha + "°", 70, 70); // Den tekst som står på skærmen og placeringen.
  text("L: " + L + " m", 70, 90); // Den tekst som står på skærmen og placeringen.
  text("E: " + E + " N", 70, 110); // Den tekst som står på skærmen og placeringen.
  text("v0: " + v0 + " m/s", 70, 130); // Den tekst som står på skærmen og placeringen.
  text("u0: " + u0 + " m/s", 70, 150); // Den tekst som står på skærmen og placeringen.
  
  if(mousePressedFlying == true) { // Det som der skal ske, hvis der er trykket på mussen og fuglen flyver.
    textSize(75);
    text("[R] for reset", width/2, height/2);
    textSize(12);
  }
  
  line(200, height-150, 200, mouseY); // line 1 | Lodret
  line(mouseX, mouseY, 200, mouseY); // line 2 | vandret
  
  float line1 = dist(200, height-150, 200, mouseY);
  float line2 = dist(mouseX, mouseY, 200, mouseY);
  
  text(line2, (mouseX+(line2/2)), mouseY+30);
  text(line1, 200+30, (mouseY-(line1/2)));
  
  if(mouseR == false && mouseP == true) {
    line(200, height-150, mouseX, mouseY);
  }
  
  fill(255, 0, 0);
  if(x == 0 && y == 0 && pulled == true && mouseR == false) {
    circle(mouseX, mouseY, 20);
    L = dist(200, height-150, mouseX, mouseY) / 8;
    //x0 = mouseX;
    //y0 = -mouseY;
    x0 = 200; // Skal starte ved slangebøssen og ikke mouseX og Y
    y0 = -650;
    alpha = acos((line1) / dist(200, height-150, mouseX, mouseY));
    //alpha = (((2 * PI) / 360) * acos((line1) / dist(200, height-150, mouseX, mouseY)));
    //alpha = atan(line1/line2);  
  }
  
  if(x == 0 && y == 0 && pulled == false) {
    circle(200, height-150, 20);
  }
  
  if(x > 0 && y > 0 && pulled == false) {
    circle(x, y, 20);
    fill(0);
    text("x: " + u0 + " * " + t + " + " + x0 + " = " + x, 500, 50);
    text("y: " + "-0.5" + " * " + g + " * " + (t*t) + " + " + v0 + " * " + t + " + " + -y0 + " = " + y, 500, 80);
  }  
  fill(0);
  
  if(mouseR == true && pulled == false && y < height-15) {
    kast(L);
  }
}


void mousePressed() {
  if(birdFlying == false) {
    mouseP = true;
    pulled = true;
    mousePressedFlying = false;
  } else {
    mousePressedFlying = true;
  }
}

void mouseReleased() { // Det som der sker, når man slipper mussen.
  mouseR = true;
  birdFlying = true;
  mouseP = false;
  pulled = false;
}

void keyPressed() { // Det som der sker når man trykker på en bestemt knap. I dette tilælde "r".
  if(key == 'r') { // Når man trykker på "r", restarter den alt. 
    x = 0; // X-koordinatet ved t.
    y = 0; // Y-koordinatet ved  t.
    t = 0; // Tiden bolden har været i luften.
    x0 = 0;
    y0 = 0; // -800.
    alpha = 0; // PI/4;.
    L = 0; // Længden slangebøssen trækkes.
    E = 0; // Affyringsenergi.
    m = 1; // Fulgens vægt (kg).
    u0 = 0; // Affyringshastighed i x-retningen
    v0 = 0; // Affyringshastighed i x-retningen
    
    mouseR = false; // Det er false, da det ikke sker fra start.
    mouseP = false; // Det er false, da det ikke sker fra start.
    pulled = false; // Det er false, da det ikke sker fra start.
    birdFlying = false; // Det er false, da det ikke sker fra start.
    mousePressedFlying = false; // Det er false, da det ikke sker fra start.
  }
}

void kast(float newL) {
  A = alpha; // PI/4;.
  E = 50 * (newL * newL); // Den formel som bruges til at finde affyringsenergien.
  u0 = sqrt((2*E)/(m*(1+(A*A)))); // Den formel som bruges til at finde affyringshastigheden i x-retningen.
  v0 = A*(sqrt((2*E)/(m*(1+(A*A))))); // Den formel som bruges til at finde affyringshastigheden i x-retningen.
  
  x = u0 * t + x0; // Den formel som bruges til at finde x-koordinatet ved t.
  y = -0.5*g*(t*t)+v0*t+y0; // Den formel som finde til at udregne y-koordinatet ved t.
  
  y = -y;
  //y = y * (-1);
  
  r[0] = x;
  r[1] = y;
  
  t = t + 0.25;
  
  println(alpha);
  println('-');
}
