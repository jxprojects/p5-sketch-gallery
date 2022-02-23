
Grid g = new Grid();

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  g.display();
}


class Grid {
  private int[][][] squareRGB = new int[500][500][3]; //r, c, rgb
  
  Grid() {
    this.setRGB();
  }
  
  int randomDelta() {
    int ret = (int)(Math.random()*16);
    boolean sign = Math.random() < 0.5;
    if (sign) {
      return ret;
    } else {
      return (int)(-1 * ret);
    }
  }
  
  void setRGB() {
    for (int i=0; i<500; i++) {
      for (int j=0; j<500; j++) {
        if (i == 0 && j == 0) {
          squareRGB[i][j][0] = 200 + (int)(Math.random()*56);
          squareRGB[i][j][1] = 200 + (int)(Math.random()*56);
          squareRGB[i][j][1] = 200 + (int)(Math.random()*56);
        } else if (i==0) {
          squareRGB[i][j][0] = squareRGB[i][j-1][0] + this.randomDelta();
          squareRGB[i][j][1] = squareRGB[i][j-1][1] + this.randomDelta();
          squareRGB[i][j][2] = squareRGB[i][j-1][2] + this.randomDelta();
          while (squareRGB[i][j][0] < 0 || squareRGB[i][j][1] < 0 || squareRGB[i][j][2] < 0 || squareRGB[i][j][0] > 255 || squareRGB[i][j][1] > 255 || squareRGB[i][j][2] > 255) {
            squareRGB[i][j][0] = squareRGB[i][j-1][0] + this.randomDelta();
            squareRGB[i][j][1] = squareRGB[i][j-1][1] + this.randomDelta();
            squareRGB[i][j][2] = squareRGB[i][j-1][2] + this.randomDelta();
          }
        } else if (j==0) {
          squareRGB[i][j][0] = squareRGB[i-1][j][0] + this.randomDelta();
          squareRGB[i][j][1] = squareRGB[i-1][j][1] + this.randomDelta();
          squareRGB[i][j][2] = squareRGB[i-1][j][2] + this.randomDelta();
          while (squareRGB[i][j][0] < 0 || squareRGB[i][j][1] < 0 || squareRGB[i][j][2] < 0 || squareRGB[i][j][0] > 255 || squareRGB[i][j][1] > 255 || squareRGB[i][j][2] > 255) {
            squareRGB[i][j][0] = squareRGB[i-1][j][0] + this.randomDelta();
            squareRGB[i][j][1] = squareRGB[i-1][j][1] + this.randomDelta();
            squareRGB[i][j][2] = squareRGB[i-1][j][2] + this.randomDelta();
          }
        } else {
          int avg0 = (int)((squareRGB[i-1][j][0] + squareRGB[i][j-1][0])/2);
          int avg1 = (int)((squareRGB[i-1][j][1] + squareRGB[i][j-1][1])/2);
          int avg2 = (int)((squareRGB[i-1][j][2] + squareRGB[i][j-1][2])/2);
          squareRGB[i][j][0] = avg0 + this.randomDelta();
          while (squareRGB[i][j][0] < 0) {
            squareRGB[i][j][0] = avg0 + this.randomDelta();
          }
          squareRGB[i][j][1] = avg1 + this.randomDelta();
          while (squareRGB[i][j][1] < 0) {
            squareRGB[i][j][1] = avg0 + this.randomDelta();
          }
          squareRGB[i][j][2] = avg2 + this.randomDelta();
          while (squareRGB[i][j][2] < 0) {
            squareRGB[i][j][2] = avg0 + this.randomDelta();
          }
        }
      }
    }
  }
  
  void display() {
    for (int i=0; i<500; i++) {
      for (int j=0; j<500; j++) {
        noStroke();
        fill(squareRGB[i][j][0], squareRGB[i][j][1], squareRGB[i][j][2]);
        rect(i, j, 1, 1);
      }
    }
  }
}