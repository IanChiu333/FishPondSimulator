class Fish {
  public float x;
  public float y;
  public float w = 70;
  public float h = 30;
  PImage sprite = fishRightImage;
  public boolean isRight = true;
  public float vx = random(-5, 5);
  public float vy = random(-5, 5);
  public float timer = 0; 
  public Food target; 

  public Fish() {
    x = 400;
    y = 400;
    target = null;
  }

  public Fish(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public void displayFish() {
    image(sprite, x-w/2, y-h/2, w, h);
    if (isRight == true) {
      sprite = fishRightImage;
    } else {
      sprite = fishLeftImage;
    }
  }
  public void move() {
    if (target != null) {
      vx = (target.x-x)/10;
      vy = (target.y-y)/10;
    }
    x += vx;
    y += vy;
    if (x > 800 || x < 0) {
      vx = -vx;
    } else if (y > 800 || y < 0) {
      vy = -vy;
    }
    if (vx < 0) {
      isRight = false;
    } else {
      isRight = true;
    }
  }
  public void randomSpeed() {
    vx = random(-5, 5);
    vy = random(-5, 5);
  }
  public void findFood() {
    for (int i=0; i<foodList.size(); i++) {
      if (distance(this, foodList.get(i)) < 300 && foodList.get(i).eaten == false) {
        target = foodList.get(i);
      }
    }
  }
  public void eatFood() {
    if (target != null && distance(this, target) < 30) {
      target.eaten = true;
      target = null;
      randomSpeed();
      w += 2;
      h += 1;
    }
  }
  public void update() {
    move();
    timer++;
    if (timer > 300) {
      randomSpeed();
      timer = 0;
    }
    findFood();
    displayFish();
    eatFood();
    if (target != null && target.eaten == true) {
      target = null;
      randomSpeed();
    }
  }
}
