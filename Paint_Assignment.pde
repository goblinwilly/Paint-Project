import controlP5.*;
ControlP5 cp5;
  
PGraphics pg;
int LightGrey;
int backgroundcolour = 250;
PImage img2;
PImage img1;
PFont font;
PFont font2;
color currentcolor;
int sliderweight = 30;

void setup()
{
 cp5 = new ControlP5(this);
 cp5.addSlider("sliderweight").setPosition (300,47).setRange(0,60).setValue(20);
 cp5.addSlider("backgroundcolour").setPosition (300,62).setRange(0,250);
 size(1920,1080);
 background(backgroundcolour);
 frameRate(60);
 LightGrey = color(200);
 img1= loadImage("icon.png");
 img2 = loadImage("Granger_Chart.jpg");
 img1.resize(300,300);
 img2.resize(200, 200);
 font = loadFont("Bahnschrift-30.vlw");
 font2 = loadFont("grafitti.vlw");
}


void draw()
{
  if (millis() < 4000)
  {
 image(img1,700,400); 
 fill(0);
 noStroke();
 textFont(font2, 60);
 text("Welcome.", 1010, 500);
 text("Please Wait...", 1020, 550);
  }
  else {

//background(backgroundcolour);

 rectMode(CORNER);  //
 strokeWeight(1);
 stroke(0);
 fill(LightGrey);
 rect(230,10,480,70);
 
 fill(LightGrey);
 stroke(10);
 rect(10,10,210,210);
 
 rectMode(RADIUS);
 fill(currentcolor);
 stroke(10);
 ellipse(265,45,sliderweight,sliderweight);  
 
 image(img2,15,15);

 fill(0);
 stroke(0);
 textFont(font, 30);
 text("select color", 35, 250);
 
 fill(0);
 textFont(font, 10);
 text("Press DEL to clear screen", 585, 70);
 
 fill(0);
 textFont(font, 10);
 text("Press S to save screenshot", 583, 50);
 
 stroke(currentcolor);
 strokeWeight(sliderweight);
 strokeCap(ROUND);
 if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

  }
}


void mousePressed(){
  
if (mouseX >15 && mouseX < 215 && mouseY > 15 && mouseY < 215 && mousePressed) {
  currentcolor = get(mouseX,mouseY);
  fill(currentcolor); }  
}

void keyPressed() 
{
  if (keyCode == 127) {          
    noStroke();
    fill(backgroundcolour);
    rect(0,0,1920,1080);
}
   if(key== 83){
     saveFrame("screenshot###.png");
}
}
