float Sx = 500;
float Sy = 500;
float Shrink = 0.5;
float boldx = 400;
float boldy = 300;
float SpeedX  = 10;
float SpeedY = 10;

void setup(){
  size(800,800);
 rectMode(CENTER);
}

void draw(){
  clear();
  noFill();
  stroke(200);
  strokeWeight(10);
rect(400,400, Sx, Sy);
ellipse(boldx,boldy,10,10);



Sx = Sx - Shrink;
Sy = Sy - Shrink;
if(boldx >= (width/2 + Sx/2)){
  SpeedX = -SpeedX;
} 
else if(boldx <= (width/2 - Sx/2)){
  SpeedX = -SpeedX;

} 
if(boldy >= (height/2 + Sy/2)){
  SpeedY = -SpeedY;

}
else if(boldy <= (height/2 - Sy/2)){
  SpeedY = -SpeedY;
}

boldx = boldx + SpeedX;

boldy = boldy + SpeedY;
}
