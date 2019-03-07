class MyWall extends MyBox {
  MyWall(float x, float y, float w, float h) {
    super(x, y, w+1, h);
    setFill(0);
    setStatic(true);
  }
}