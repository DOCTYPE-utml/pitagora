import fisica.*;

FWorld world;
MyCircle cOfA, cOfB, cOfC, cOfD, cOfE, cOfF, cOfG;
MyWall guardFromB;

MyBox mb1, mb2, mb3, mb4;
FPrismaticJoint fpj, fpj2;

int sw=0, sw2=0, sw3=0, sw4=0;
boolean a, b, c, d, dsw, e, end=false;

float G=9.8, dg=100;
float Qb=32;

void setup() {
  size(1024, 576);
  Fisica.init(this);
  world=new FWorld();
  world.setGravity(0, 0);

  ArrangeObjed();
  ArrangeObj1();
  ArrangeObj2();
  ArrangeObj3();
  ArrangeObj4();

  cOfA=new MyCircle(Qb, Qb, Qb);
  cOfA.setDensity(50);
  cOfA.setStatic(true);
  cOfA.setVelocity(400, 0);
  world.add(cOfA);
}

void draw() {
  if (!end) {
    background(150);
  } else {
    background(50);
  }

  stroke(0);
  line(0, height/2.0, width, height/2.0);
  line(width/2.0, 0, width/2.0, height);
  line(Qb*4, Qb*6, Qb*4, Qb*8.5);

  fill(100);
  rect(Qb*21.5, Qb*14, Qb/2.0, Qb*2);
  rect(Qb*22.5, Qb*14, Qb/2.0, Qb*2);
  rect(Qb*23.5, Qb*14, Qb/2.0, Qb*2);
  ellipse(Qb*25, Qb*15.5, Qb, Qb);
  fill(0);
  rect(Qb*26, Qb*16, Qb, Qb/2.0);
  rect(Qb*26.5, Qb*1.5, Qb/2.0, Qb*4);

  noStroke();
  if (!end) {
    fill(255);
    rect(Qb*5.75, Qb*8, Qb/2.0, Qb/2.0);
    rect(Qb*14.75, Qb/2.0, Qb/2.0, Qb/2.0);

    fill(0, 0, 100);
    rect(Qb*25.25, Qb*8, Qb/2.0, Qb/2.0);
    fill(100, 0, 0);
    rect(Qb*28.75, Qb*15.5, Qb/2.0, Qb/2.0);

    if (!a) {
      fill(100);
      rect(Qb*13.75, Qb*2.5, Qb/2.0, Qb/2.0);
    }
    if (!b) {
      fill(200);
      rect(Qb*25.25, Qb*0.5, Qb/2.0, Qb/2.0);
    }
    if (!c) {
      fill(255);
      rect(Qb*0.75, Qb*17, Qb/2.0, Qb/2.0);
    }
    if (!dsw) {
      fill(255);
      rect(Qb*28.75, Qb*12.5, Qb/2.0, Qb/2.0);
    }
  }

  for (int i=0; i<world.getBodies().size(); i++) {
    FBody body=(FBody)world.getBodies().get(i);
    if (body.getX()>Qb*16.5 && body.getX()<=Qb*20 && body.getY()>Qb && body.getY()<=Qb*7.5) {//箱
      body.addForce(body.getMass()*G*dg, 0);
    } else if (body.getY()<height/2.0 && body.getX()<width/2.0) {//1
      body.addForce(0, pow(-1, sw)*body.getMass()*G*dg);
    } else if (body.getY()<height/2.0 && body.getX()>=width/2.0) {//2
      if (body==mb1 || body==mb3) {
        if (body.getY()>Qb*5.75) {
          body.addForce(0, -body.getMass()*G*dg);
        } else {
          body.addForce(0, body.getMass()*G*dg);
        }
      } else {
        body.addForce(0, pow(-1, sw2)*-body.getMass()*G*dg);
      }
    } else if (body.getY()>=height/2.0 && body.getX()<width/2.0) {//3
      body.addForce(0, pow(-1, sw3)*body.getMass()*G*dg);
    } else {//4
      body.addForce(0, pow(-1, sw4)*body.getMass()*G*dg);
    }
  }

  judgeSwitches();

  world.step();
  world.draw();
}

void mousePressed() {
  if (mouseButton==RIGHT) {
    MyCircle c=new MyCircle(mouseX, mouseY, Qb);
    c.setDensity(5);
    c.setGrabbable(true);
    world.add(c);
  } else {
  }
}

void keyPressed() {
  MyCircle c;
  switch(key) {
  case ENTER:
    for (int i=0; i<world.getBodies().size(); i++) {
      FBody body=(FBody)world.getBodies().get(i);
      body.setStatic(false);
    }
    break;
  case 'a':
    MyWall wl;
    wl=new MyWall(Qb*9, Qb*2.5, Qb*4, Qb/2.0);
    world.add(wl);
    break;
  case 'b':
    world.remove(guardFromB);
    break;
  case 'c':
    c=new MyCircle(Qb*17, 0, Qb-2);
    c.setDensity(5);
    world.add(c);
    break;
  case 'd':
    c=new MyCircle(Qb*30.5, 0, Qb-2);
    c.setDensity(5);
    world.add(c);
    break;
  case ' ':
    cOfA.setStatic(false);
    break;
  case '1':
    sw++;
    break;
  case '2':
    sw2++;
    break;
  case '3':
    sw3++;
    break;
  case '4':
    sw4++;
    break;
  default:
    break;
  }
}