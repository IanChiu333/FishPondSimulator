class Food {
  public float x;
  public float y;
  public float w = 10;
  public float h = 15;
  public boolean eaten = false;
  PImage sprite = fruitImage;

  public Food() {
    x = mouseX;
    y = mouseY;
  }
  public Food(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public void displayFood() {
    if (eaten == false) {
      image(sprite, x-w/2, y-h/2, w, h);
    }
  }
  public void update() {
    displayFood();
  }
}


//https://processing.org/reference/
