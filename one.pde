
// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  Particle particles[] = new Particle[100];
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();

    for(int i = 0; i < particles.length; i++){
      this.particles[i] = new Particle();
    }
}

  void addParticle() {
    for(Particle p : this.particles){
      if(p.lifespan <= 0){
        p.respawn(this.origin);
        return;
      }
    }
  }

  void run() {
    for(Particle p : this.particles){
      if(p.lifespan > 0)
        p.run();
    }
  }
}

// Using Generics now!  comment and annotate, etc.

class BubbleSystem {
  Bubble bubbles[] = new Bubble[100];
  PVector origin;

  BubbleSystem(PVector location) {
    origin = location.get();
    
    for(int i = 0; i < bubbles.length; i++){
      this.bubbles[i] = new Bubble();
    }

  }

  void addParticle() {
   for(Bubble p : this.bubbles){
      if(p.lifespan <= 0){
        p.respawn(this.origin);
        return;
      }
    }
  }

  void run() {
    for(Bubble p : this.bubbles){
      if(p.lifespan > 0)
        p.run();
    }
  }
}
