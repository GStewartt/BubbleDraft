ParticleSystem ps; 
BubbleSystem qc;

void setup() {
  size(800,800);
 ps = new ParticleSystem(new PVector(700,400));
 qc = new BubbleSystem(new PVector(100,400));
}

void draw() {
  background(255);
  if(mousePressed){
   ps.addParticle();
   qc.addParticle();
  }
  ps.run();
 
  qc.run();
 
  //Wands
  smooth();
  stroke(1);
  fill(130,0,0);// maroon
  arc(90,400,50,50, radians(40), radians(320));// wand for BubbleSystem qc
  stroke(2);
  line(67,400, 67,500);
  fill(0,0,0);// black
  triangle(740,400, 701,430, 701,370);// wand for ParticleSystem ps
  stroke(2);
  line(740,400, 740,500);
}
