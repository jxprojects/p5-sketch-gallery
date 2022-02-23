int cnv;
int width = 500;
int height = 500;
double centerPtX = width/4 + Math.random() * width/2;
double centerPtH = width/4 + Math.random() * height/2;
ArrayList<int[]> colors = new ArrayList<int[]>();
int index = 100000;
ArrayList<int[]> bkgcolors = new ArrayList<int[]>();
int inc = width/100;


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void setup() {
  size(500, 500);
  for (int i=0; i<index; i++) {
      int[] ret = new int[3];
      for (int j=0; j<3; j++) {
          ret[j] = (int)(105 + (Math.random() *150));
      }
      colors.add(ret);
  }
  for (int i=0; i<90; i++) {
      int[] ret = new int[3];
          for (int j=0; j<3; j++) {
            ret[j] = (int)(105 + (Math.random() *150));
          }
          bkgcolors.add(ret);
  }
  
}

void draw() {
        noStroke();
        int j=0;
        for (int i=0; i<90; i++) {
            fill(bkgcolors.get(i)[0], bkgcolors.get(i)[1], bkgcolors.get(i)[2]);
            arc((int)centerPtX, (int)centerPtH, 300, 300, radians(j), radians(j+4));
            j+=4;
        }
    for (int i=0; i<index; i++) {
        noStroke();
        fill(colors.get(i)[0], colors.get(i)[1], colors.get(i)[2]);
        rect((float)(centerPtX +  (( i + 9)/10) * cos(radians(i))), (float)(centerPtH + (( i + 9)/10)* sin(radians(i))), i/50, i/50);
    }
}





