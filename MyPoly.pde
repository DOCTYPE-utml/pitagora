class MyPoly extends FPoly {
  MyPoly(float x, float y) {
    super();
    setPosition(x, y);
    setFill(100);
    setRestitution(0);
    setFriction(0);
    setGrabbable(false);
  }
}