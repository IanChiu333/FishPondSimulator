PImage fishLeftImage;
PImage fishRightImage;
PImage fruitImage;
Fish fish;
Food food;
ArrayList<Food> foodList = new ArrayList<Food>();
int r = 137;
int g = 207;
int b = 240;
Fish[] fishArray = new Fish[10];

void setup() {
  size(800, 800);
  fishLeftImage = loadImage("fishLeft.png");
  fishRightImage = loadImage("fishRight.png");
  fruitImage = loadImage("fruit8.png");
  for (int i=0; i<10; i++) {
    fishArray[i] = new Fish();
  }
  food = new Food();
}
void draw() {
  background(r,g,b);
  r += random(-1,2);
  g += random(-1,2);
  for (int i=0; i<10; i++) {
    fishArray[i].update();
  }
  for(int i=0; i < foodList.size(); i++) {
    foodList.get(i).update();
  }
}
void mousePressed() {
  foodList.add(new Food());
}
public float distance(Fish fish, Food food) {
  float sideA = fish.x - food.x;
  float sideB = fish.y - food.y;
  return(sqrt(sideA*sideA + sideB*sideB));
}
