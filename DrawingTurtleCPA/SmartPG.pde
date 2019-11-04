class SmartPG{
  
  PGraphics pg;
  float minX = Float.MAX_VALUE;
  float minY = Float.MAX_VALUE;
  float maxX = -Float.MAX_VALUE;
  float maxY = -Float.MAX_VALUE;
  
  SmartPG( int w, int h){
    pg = createGraphics(w,h);
  }
  
  void beginDraw(){
    pg.beginDraw();
  }
  
  void endDraw(){
    pg.endDraw();
  }
  
  void line( PVector P1, PVector P2 ){
    // update bounds
    if( P1.x < minX )
      minX = P1.x;
    else if( P1.x > maxX )
      maxX = P1.x;
    if( P2.x < minX )
      minX = P2.x;
    else if( P2.x > maxX )
      maxX = P2.x;
    if( P1.y < minY )
      minY = P1.y;
    else if( P1.y > maxY )
      maxY = P1.y;
    if( P2.y < minY )
      minY = P2.y;
    else if( P2.y > maxY )
      maxY = P2.y;
    // 
    pg.line( P1.x, P1.y, P2.x, P2.y );
  }
  
  void show(){
    float dX = (maxX - minX)*0.1;
    float dY = (maxY - minY)*0.1;
    float _maxX = maxX + dX;
    float _minX = minX - dX;
    float _maxY = maxY + dY;
    float _minY = minY - dY;
    float sX = width / (_maxX - _minX);
    float sY = height / (_maxY - _minY);
    float s = min(min(sX, sY), 3);
    
    image( pg, -_minX * s, -_minY * s, pg.width * s, pg.height * s );
    //image(pg, 0 , 0, width, height);
    //println( "minX " , minX, "minY " , minY, "maxX " , maxX, "maxY " , maxY  );
  }
  
  void show( Turtle turtle ){
    float dX = (maxX - minX)*0.1;
    float dY = (maxY - minY)*0.1;
    float _maxX = maxX + dX;
    float _minX = minX - dX;
    float _maxY = maxY + dY;
    float _minY = minY - dY;
    float sX = width / (_maxX - _minX);
    float sY = height / (_maxY - _minY);
    float s = min(min(sX, sY), 3);
    turtle.show(PVector.add(PVector.mult(turtle.pos,s), new PVector(-_minX * s, -_minY * s)));
  }
}
