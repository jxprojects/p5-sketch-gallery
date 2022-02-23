ArrayList<BuildingRHS> b = new ArrayList<BuildingRHS>();
int angler = 10 + 10 * (int)(Math.random() * 30);
int vanishPtY1 = 500;
int vanishPtX = 250;
double slope = (angler / 250.0);
BuildingRHS tester = new BuildingRHS(100, 120, 100, getPt(100, 250, 500));
ArrayList<ArrayList<BuildingRHS>> rtb = new ArrayList<ArrayList<BuildingRHS>>();

void setup() {
  size(500, 500);
  int i=250;
  while (i < 500) {
    int inc = (int)(20 + Math.random() *  50);
    BuildingRHS a = new BuildingRHS(i, i+inc, 250, 500);
    b.add(a);
    i+=inc;
  }
  for (int k=b.size()-1; k>=0; k--) {
    ArrayList<BuildingRHS> x = forYou(k);
    rtb.add(x);
  }
}

ArrayList<BuildingRHS> forYou(int index) {
  ArrayList<BuildingRHS> ret = new ArrayList<BuildingRHS>();
  int startAt = b.get(index).startXB - b.get(index).depth;
  while (startAt >= 0) { //sumting wong w u
    BuildingRHS x = new BuildingRHS(startAt, startAt+b.get(index).width, startAt, getPt(startAt, b.get(index).startXB, b.get(index).startYB));
    ret.add(x);
    startAt-=x.depth;
  }
  return ret;
}

int getPt(int x, int xRel, int yRel) {
  if (x < xRel) {
    return (int)(yRel - (xRel-x)*(slope));
  } else {
    return (int)(yRel - (x-xRel)*(slope));
  }
}

void drawBack(int x1, int y1, int depth) {
  int yaa = (int)(y1-slope*depth);
  line(x1, y1, x1-depth, yaa);
}



void draw() {
  strokeWeight(2);
  background(0);
  stroke(255);
  line(vanishPtX, vanishPtY1, 0, vanishPtY1 - angler);
  line(vanishPtX, vanishPtY1, 500, vanishPtY1 - angler);
  
  //tester.display();
  for (int i=b.size()-1; i>=0; i--) {
    for (int j=rtb.get(b.size()-1-i).size()-1; j>=0; j--) {
      rtb.get(b.size()-1-i).get(j).display();
    }
   b.get(i).display();
  }
}

class BuildingRHS {
  int vanishX, vanishY;
  int myR = (int)(Math.random() * 255);
  int myG = (int)(Math.random() * 255);
  int myB = (int)(Math.random() * 255);
  int width;
  int height = (int)(100 + Math.random() * 300);
  int depth = (int)(50 + Math.random() * 100);
  int startXB, startYB, endXB, endYB;
  int startYH, endYH;
  int endXD = 250 - depth;
  
  BuildingRHS(int xS, int xE, int vX, int vY) {
    this.startXB = xS;
    this.endXB = xE;
    this.vanishX = vX;
    this.vanishY = vY;
    this.startYB = getPt(startXB, vanishX, vanishY);
    this.endYB = getPt(endXB, vanishX, vanishY);
    this.startYH = startYB - this.height;
    this.endYH = endYB - this.height;
    this.width = endXB- startXB;
  }
  void display() {
    stroke(myR, myG, myB);
    line(startXB, getPt(startXB, vanishX, vanishY), endXB, getPt(endXB, vanishX, vanishY));
    line(startXB, startYH, endXB, endYH);
    line(endXB, endYB, endXB, endYB-height);
    for (int i=startXB; i<=endXB+1; i+=(width/15)) {
      line(i, getPt(i, vanishX, vanishY), i, getPt(i, vanishX, vanishY)-height);
    }
    for (int i=startYB; i>=startYH; i-=(height/15)) {
      line(startXB, startYB-i+startYB-height, endXB, endYB - i+startYB-height);
    }
    drawBack(startXB, startYB, depth);
    drawBack(endXB, endYB, depth);
    drawBack(endXB, endYB-height, depth);
    for (int i=endYB; i>=endYB-height; i-=(height/15)) {
      drawBack(endXB, i, depth);
    }
    for (int i=endXB; i>=endXB-depth; i-=(depth/15)) {
      line(i, getPt(i, endXB, endYB), i, getPt(i, endXB, endYB)-height);
    }
    line(endXB-depth, getPt(endXB-depth, endXB, endYB), endXB-depth, getPt(endXB-depth, endXB, endYB)-height);
    drawBack(startXB, startYB-height, depth);
    for (int i=startYB; i>=startYB-height; i-=(height/15)) {
      drawBack(startXB, i, depth);
    }
    for (int i=startXB; i>=startXB-depth; i-=(depth/15)) {
      line(i, getPt(i, startXB, startYB), i, getPt(i, startXB, startYB)-height);
    }
    line(startXB-depth, getPt(startXB-depth, startXB, startYB), startXB-depth, getPt(startXB-depth, startXB, startYB)-height);
    line(startXB-depth, getPt(startXB-depth, startXB, startYB), endXB-depth, getPt(endXB-depth, startXB-depth, getPt(startXB-depth, startXB, startYB)));
    line(startXB-depth, getPt(startXB-depth, startXB, startYB)-height, endXB-depth, getPt(endXB-depth, startXB-depth, getPt(startXB-depth, startXB, startYB))-height);
    for (int i=startXB-depth; i<=startXB-depth+width; i+=(width/15)) {
      line(i, getPt(i, startXB-depth, getPt(startXB-depth, startXB, startYB)), i, getPt(i, startXB-depth, getPt(startXB-depth, startXB, startYB))-height);
    }
    //drawFront(100, 200, width);
    for(int i=getPt(startXB-depth, startXB, startYB); i>=getPt(startXB-depth, startXB, startYB)-height; i-=(height/15)) {
      line(startXB-depth, i, startXB-depth+width, getPt(startXB-depth+width, startXB-depth, i));
    }
    for(int i=startXB; i>=startXB-depth; i-=(depth/15)) {
      line(i, getPt(i, startXB, startYB)-height, i+width, getPt(i+width, i, getPt(i, startXB, startYB))-height);
    }
    for (int i=startXB; i<=endXB; i+=(width/15)) {
      line(i, getPt(i, startXB, startYB-height), i-depth, getPt(i-depth, i, getPt(i, startXB, startYB-height)));
    }
  }
}