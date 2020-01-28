class Particle {

  PVector p, v, a; //position, velocity, acceleration
  float d; //diameter
  color c; //colour
  int life; //lifespan
  boolean dead; //dead or naw

  Particle(float tempX, float tempY) {
    p = new PVector(tempX, tempY);
    v = new PVector(random(-3, 3), 0);
    a = new PVector(0, 0.1);
    d = 40;
    c = color(255, random(0, 155), random(0, 155));
    life = 120; //lifespan of 2 seconds approx.
    dead = false;
  }

  void display() {
    noStroke();
    fill(c, 50);
    rect(p.x, p.y, d, d);
  }

  void move() { //moves according to gravity
    v = v.add(a);
    p = p.add(v);
  }

  void timer() { //timer to remove object after certain amount of time (reduce lag)
    life--;
    if (life < 0) {
      dead = true;
    }
  }

  void collision() { //bounces off of the walls & ground
    if (p.x <= 0 || p.x + d >= width) {
      v.x *= -1;
    } else if (p.y >= height || p.y + d <= 0) {
      v.y *= -1;
      p.y = (height - d);
    }
  }
}

void particleBackground() { //function to draw the pretty menu background
  background(0);
  for (int i = 0; i < 2; i++) { //add two particles per draw
    particles.add(new Particle(random(width), random(height/2))); 
  }
  for (Particle p : particles) { //for every particle...
    p.display();
    p.move();
    p.collision();
    p.timer();
  }
  for (int i = 0; i < particles.size(); i++) { //for loop to get dead particles and remove them from the array
    Particle p = particles.get(i);
    if (p.dead) { //if dead = true
      particles.remove(i); //remove from arraylist
    }
  }
}