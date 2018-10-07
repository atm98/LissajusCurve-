float angle=0;
int w =60;
int cols ;
int rows ;
Curve[][] curves;
void setup(){
  size(600,600); 
  
  rows = height/w ;
  cols = width/w ;
  curves = new Curve[rows][cols];
  for(int i=0;i<rows;i++){
    for(int j=0;j<cols;j++){
      curves[i][j] = new Curve();
    }
  }
}
void draw(){
  background(0);
  float d = w-10;
  float r = d/2;
  
 noFill();
  stroke(255);
  for (int i = 0; i < cols; i++) {
    float cx = w + i * w + w / 2;
    float cy = w / 2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x = r * cos(angle * (i + 1) - HALF_PI);
    float y = r * sin(angle * (i + 1) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy + y);
    stroke(255, 150);
    strokeWeight(1);
    line(cx + x, 0, cx + x, height); 
    for(int j=0;j<rows;j++){
      curves[j][i].addx(cx+x);
    }
    
  }
  noFill();
  stroke(255);
  for (int j = 0; j < rows; j++) {
    float cx = w / 2;
    float cy = w + j * w + w / 2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x = r * cos(angle * (j + 1) - HALF_PI);
    float y = r * sin(angle * (j + 1) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy + y);
    stroke(255, 150);
    strokeWeight(1);
    line(0, cy + y, width, cy + y);
    for(int i=0;i<rows;i++){
      curves[j][i].addy(cy+y);
    }
    
  }
  for(int j=0;j<rows;j++){
    for(int i=0;i<cols;i++){
      //print(curves[j][i].path);
      curves[j][i].addPoint();
      curves[j][i].show();
    }
  }
  angle+=0.01;
}
