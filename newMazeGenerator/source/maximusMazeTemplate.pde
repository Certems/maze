ArrayList<mazePiece> pieces = new ArrayList<mazePiece>();
int cols = 40;
int rows = 40;
float sWidth = 15;
boolean addColour = false;

void setup(){
  size(800,800);
}

void draw(){
  background(0,0,0);
  drawMaze();
  pushStyle();
  fill(255,255,255);
  textSize(15);
  text("1 = generator new maze", 600,800-20);
  text("2 = -5 rows and columns", 600,800-40);
  text("3 = +5 rows and columns", 600,800-60);
  text("4 = -5 width spacing", 600,800-80);
  text("5 = +5 width spacing", 600,800-100);
  text("6 = colour maze", 600,800-120);
  popStyle();
}

void keyPressed(){
  if(key == '1'){
    createMaze();
  }
  if(key == '2'){
    cols -= 5;
    rows -= 5;
    createMaze();
  }
  if(key == '3'){
    cols += 5;
    rows += 5;
    createMaze();
  }
  if(key == '4'){
    sWidth -= 5;
    createMaze();
  }
  if(key == '5'){
    sWidth += 5;
    createMaze();
  }
  if(key == '6'){
    addColour = !addColour;
    createMaze();
  }
}

void createMaze(){
  pieces.clear();
  for(int j=0; j<rows; j++){
    for(int i=0; i<cols; i++){
      if(addColour){
        mazePiece newPiece = new mazePiece( new PVector(sWidth*j, sWidth*i), findDir( floor(random(0,4)) ), new PVector( floor(random(0,255)), floor(random(0,255)), floor(random(0,255)) ) );
        pieces.add(newPiece);
      }
      else
      {
        mazePiece newPiece = new mazePiece( new PVector(sWidth*j, sWidth*i), findDir( floor(random(0,4)) ), new PVector(255,255,255) );
        pieces.add(newPiece);
      }
    }
  }
}
void drawMaze(){
  if(pieces.size() > 0)
  {
    for(int j=0; j<rows; j++){
      for(int i=0; i<cols; i++){
        pieces.get( int(i +j*cols) ).display();
      }
    }
  }
}
PVector findDir(int n){
  if(n == 0){
    return new PVector(sWidth,0);
  }
  if(n == 1){
    return new PVector(-sWidth,0);
  }
  if(n == 2){
    return new PVector(0,sWidth);
  }
  else{
    return new PVector(0,-sWidth);
  }
}

class mazePiece{
  PVector pos;
  PVector dir;
  PVector col;
  
  mazePiece(PVector position, PVector direction, PVector colour){
    pos = position;
    dir = direction;
    col = colour;
  }
  
  void display(){
    pushStyle();
    stroke(col.x, col.y, col.z);
    strokeWeight(3);
    line(pos.x, pos.y, pos.x +dir.x, pos.y +dir.y);
    popStyle();
  }
}
