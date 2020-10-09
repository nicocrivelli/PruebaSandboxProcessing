class Thing
{
  PVector pos;
  float radius;
  int lifetime;

  Thing()
  {
    this.radius = random(5, 50);
    this.pos = new PVector(random(min(width, height) * 0.5f - this.radius), 0.0f);
    this.pos.rotate(random(TWO_PI));
    this.pos.add(new PVector(width * 0.5f, height * 0.5f));
    this.lifetime = int(floor(random(10, 100)));
  }

  boolean isDead()
  {
    return this.lifetime <= 0;
  }

  void update()
  {
    this.lifetime--;
  }

  void draw()
  {
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }
};

ArrayList<Thing> things;
void setup()
{
  size(800, 600);
  things = new ArrayList<Thing>();
  for (int t = 0; t < 10; t++)
    things.add(new Thing());
}

void draw()
{
  background(32);
  noStroke();
  fill(128, 64, 32);
  for (int i = things.size()-1; i >= 0; i--)
  {
    Thing t = things.get(i);
    t.update();
    t.draw();
    if (t.isDead())
    {
      things.remove(t);
      things.add(new Thing());
      if (things.size() < 100)
        things.add(new Thing());
    }
  }
}
