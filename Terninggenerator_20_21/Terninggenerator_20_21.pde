int[] numbers = new int [31];  
int counter = 0;               

int ener = 0;                  
int toer = 0;                  
int treer = 0;                
int fireer = 0;                 
int femer = 0;                 
int sekser = 0;                 

void setup() {
  size(800, 800);
  clear();
  textSize(20);
  
  text("TRYK på 'k' FOR AT KASTE", 50, 50);          
  text("Fordeling af terningekast", 70, 750);
  for(int b=1; b<=6; b++)text(b, 20+50*b, 700);
  textSize(14);
  for(int b = 0; b<300; b+=50)text("0 stk",60+b,660);
  
}

void draw() {
}

void keyPressed() {
  clear();
  textSize(20);
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if ((key=='k' || key == 'K') && counter < 30) {
    counter++;                               
    int kast = lavTerningeKast(1, 7);        
    text("DIT KAST BLEV:" + kast, 50, 75);
  }

  if ((key == 's' || key == 'S') && counter>0) {
    fjernSidsteKast();                       
  }
  tegnFordeling();                           
  udskrivKast();                             
  if(counter==0)text("DIT KAST BLEV: ", 50, 75);
  if(counter==30)text("DIT KAST BLEV:"+numbers[counter], 50, 75);
}

int lavTerningeKast(int min, int max){        
  int nyKast = int(random(min,max));         
  numbers[counter] = nyKast;                
  
  if(nyKast==1)ener++;                      
  if(nyKast==2)toer++;                       
  if(nyKast==3)treer++;                     
  if(nyKast==4)fireer++;                      
  if(nyKast==5)femer++;                      
  if(nyKast==6)sekser++;                     
  return nyKast;
}  

void udskrivKast(){
  for(int b=1;b<=counter;b++){                      
  text("Kast "+b+": "+numbers[b],600,50+20*b);      
  }
}

void fjernSidsteKast(){
  if(numbers[counter]==1)ener--;                   
  if(numbers[counter]==2)toer--;                    
  if(numbers[counter]==3)treer--;                 
  if(numbers[counter]==4)fireer--;                   
  if(numbers[counter]==5)femer--;                   
  if(numbers[counter]==6)sekser--;                   
  
  counter--;                            
  text("DIT KAST BLEV:" + numbers[counter], 50, 75); 
}

void tegnFordeling(){   
  
  text("Fordeling af terningekast", 70, 750);       
  for(int b=1; b<=6; b++){                         
    text(b, 20+50*b, 700);                          
  }
  
  textSize(14);
  rect(55,670,45,ener*-20);     text(ener+" stk",60,660-ener*20);       
  rect(105,670,45,toer*-20);    text(toer+" stk",110,660-toer*20);          
  rect(155,670,45,treer*-20);  text(treer+" stk",160,660-treer*20);       
  rect(205,670,45,fireer*-20);   text(fireer+" stk",210,660-fireer*20);      
  rect(255,670,45,femer*-20);   text(femer+" stk",260,660-fireer*20);         
  rect(305,670,45,sekser*-20);   text(sekser+" stk",310,660-sekser*20);         
  textSize(20);
}
