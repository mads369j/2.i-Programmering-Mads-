color c = color(0);
float x = 0;
float y = 100;
float speed = 1;
float x1 = 40;
float y1 = 100;
float x2 = 40;
float y2 = 112;

class Lights {
Lights myLights;

}

class Car {
Car myCar; 

}

void setup() {
  size(200,200);
  Car myCar = new Car();
  Lights myLights = new Lights();
}

void draw() {
  background(255);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
 x1 = x1 + speed;
  if (x1 > width) {
    x1 = 0;
  }
 x2 = x2 + speed;
  if (x2 > width) {
    x2 = 0;
  }
}


void display() {
  fill(c);
  rect(x,y,50,20);
  
  fill(255,204,0);
  rect(x1,y1,10,8);
  
  fill(255,204,0);
  rect(x2,y2,10,8);
}
