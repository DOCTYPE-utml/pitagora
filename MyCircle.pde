class MyCircle extends FCircle {
  MyCircle(float x, float y,float r) {
    super(r);
    setPosition(x, y);
    setFill(100);
    setRestitution(0.5);
    setFriction(0);
    setGrabbable(false);
  }
}