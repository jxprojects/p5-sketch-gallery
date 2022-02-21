// alexthescott 4/24/21
// my attempt at a faithful recreation of beesandbombs's
// https://twitter.com/beesandbombs/status/1385611174704713728
// all credit goes to Dave :)

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
var cnv;
var width = 500;
var height = 500;
var centerPtX = width/4 + Math.random() * width/2;
var centerPtH = width/4 + Math.random() * height/2;
var colors = [];
var index = 100000;
var bkgcolors = [];
var inc = width/100;

function centerCanvas() {
  var x = (windowWidth - width) / 2;
  var y = 60;
  cnv.position(x, y);
}

function windowResized() {
  centerCanvas();
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function setup() {
  cnv = createCanvas(500, 500);
  centerCanvas();
  for (var i=0; i<index; i++) {
      colors[i] = [];
      for (var j=0; j<3; j++) {
          colors[i][j] = 105 + (Math.random() *150);
      }
  }
  for (var i=0; i<100; i++) {
      bkgcolors[i] = [];
      for (var h=0; h<height; h+=5) {
          bkgcolors[i][h] = [];
          for (var j=0; j<3; j++) {
            bkgcolors[i][h][j] = 105 + (Math.random() *150);
          }
      }
      
  }
  
}

function draw() {
        noStroke();
        for (var h=0; h<height; h+=5) {
            for (var i=0; i<100; i++) {
                fill(bkgcolors[i][h][0], bkgcolors[i][h][1], bkgcolors[i][h][2]);
                rect(i * width/100, h, width/100, 500);
            }
        }
    for (var i=0; i<index; i++) {
        noStroke();
        fill(colors[i][0], colors[i][1], colors[i][2]);
        rect(centerPtX +  (( i + 9)/10) * cos(radians(i)), centerPtH + (( i + 9)/10)* sin(radians(i)), i/50, i/50);
    }
}





