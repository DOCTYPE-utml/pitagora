class MyBox extends FBox {
  MyBox(float x, float y, float w, float h) {
    super(w-1, h);
    setPosition(x+(w-1)/2.0, y+(h)/2.0);
    setFill(100);
    setRestitution(0);
    //setGrabbable(false);
  }
}