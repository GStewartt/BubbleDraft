// Simple Particle System

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 0;
  
  public Particle(){
    this.respawn(new PVector(0, 0));
    this.lifespan = 0;
  }

  public void respawn(PVector l){
    acceleration = new PVector(-.1,0); //changes the direction of wand ps
    velocity = new PVector(random(-1,-.001),random(-1,-.001));
    location = l.get();
    lifespan = 150.0;// changes how long each particle is visible
    
  }
  

  void run() {
    update();
    display();

  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    
    this.collider();
  }
  
  private void collider(){
    for(Bubble b : qc.bubbles){
       float distance = sqrt(pow(b.location.x - this.location.x, 2) + pow(b.location.y - this.location.y, 2));
       
       if(distance < 6){
         this.lifespan = 0;  
         b.lifespan = 0;
       }
      
    }   
    
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan);
    ellipse(location.x,location.y,12,12);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



// Simple Particle System 2: this is wand qc

class Bubble {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float yAcceleration;
  float lifespan = 0;

  public Bubble(){
    this.respawn(new PVector(0, 0));
    this.lifespan = 0;  
  }

  public void respawn(PVector l){
    acceleration = new PVector(.1, -.03); //changes the direction of both wands
    velocity = new PVector(random(1,0),random(0,1));
    location = l.get();
    lifespan = 200.0;// changes how long each particle is visible  
    
  }

  void run() {
    update();
    display();
    
    this.collider();

  }
  
  private void collider(){
    for(Particle p : ps.particles){
       float distance = sqrt(pow(p.location.x - this.location.x, 2) + pow(p.location.y - this.location.y, 2));
       
       if(distance < 6){
         this.lifespan = 0;  
         p.lifespan = 0;
       }
      
    }   
    
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan);
    ellipse(location.x,location.y,12,12);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  
  }
  
  }
