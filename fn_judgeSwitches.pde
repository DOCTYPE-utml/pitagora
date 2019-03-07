void judgeSwitches() {
  if (dist(cOfA.getX(), cOfA.getY(), Qb*6, Qb*8)<4) {
    sw=1;
  }
  if (dist(cOfA.getX(), cOfA.getY(), Qb*15, Qb)<4) {
    sw=0;
  }
  if (dist(cOfA.getX(), cOfA.getY(), Qb*13.5, Qb*3)<4) {
    MyWall wl;
    wl=new MyWall(Qb*9, Qb*2.5, Qb*4, Qb/2.0);
    world.add(wl);
    a=true;
  }

  if (dist(cOfB.getX(), cOfB.getY(), Qb*25.5, Qb*0.75)<4) {
    world.remove(guardFromB);
    b=true;
  }

  if (dist(cOfC.getX(), cOfC.getY(), Qb, Qb*17)<4) {
    sw3=1;
    c=true;
  }

  if (dist(cOfD.getX(), cOfD.getY(), Qb*29, Qb*12.5)<4) {
    sw2=1;
    dsw=true;
  }
  if (dist(cOfD.getX(), cOfD.getY(), Qb*31, Qb*17)<4 && !d) {
    cOfG=new MyCircle(Qb*30.5, 0, Qb-2);
    cOfG.setDensity(5);
    world.add(cOfG);
    d=true;
  }

  if (dist(cOfE.getX(), cOfE.getY(), Qb*26.5, Qb*17)<4 && !e) {
    cOfF=new MyCircle(Qb*17, 0, Qb-2);
    cOfF.setDensity(5);
    world.add(cOfF);
    e=true;
  }

  if (cOfF!=null && cOfG!=null) {
    if ((dist(cOfF.getX(), cOfF.getY(), Qb*28, Qb*7.5)<Qb || dist(cOfB.getX(), cOfB.getY(), Qb*28, Qb*7.5)<Qb) && dist(cOfG.getX(), cOfG.getY(), Qb*30.5, Qb*7.5)<Qb) {
      for (int i=0; i<world.getBodies().size(); i++) {
        FBody body=(FBody)world.getBodies().get(i);
        body.setStatic(false);
        end=true;
      }
    }
  }
}