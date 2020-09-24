int antalKasserNed = 18;
//hej

void setup() {
 size(800, 800);
 rectMode(CENTER);
 frameRate(20);
}

void draw(){
clear();
fill(255);
int antalNed = 0; // Jeg har her lavet et loop, "antalNed++" nede i bunden af koden, gøt så den hele tiden stiger med 1.
while (antalNed != antalKasserNed) { // Det er looped og den køre så længe det i parantecerne er sandt.
  for (int i = 40; i < 760; i++) { // Dens værdier, skal køre 760 gange og bliver 1 større hele tiden.
    if(i % 40 == 0) { // Den tegner en kasse hver 40'ne gang.
      float boxSize = random(20, 40); // En mimimum kasse størrelse og random, for at de hele tiden skifter størrelse.
      rect(i, ((40 * antalNed) + 49), boxSize, boxSize); // Begge størrelser er samme float, da den ellers ville lave en rektangel ogg ikke en kvadrat.
      }
     }
     antalNed++;
    }
   }
