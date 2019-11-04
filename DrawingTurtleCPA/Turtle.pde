class Turtle{
  PVector prevPos;
  PVector pos;
  float stepLength = 5;
  PVector dir;
 
  Turtle(){
    prevPos = new PVector( background.pg.width*0.5, background.pg.height*0.5 );
    pos = prevPos.copy();
    dir = new PVector(1, 0);
  }
  
  void show(PVector p){
    noStroke();
    fill( 255 , 0 , 0 );
    pushMatrix();
    translate( p.x, p.y );
    rotate( dir.heading() );
    triangle( -5, -5, -5, 5, 15, 0 );
    popMatrix();
  }
  
  void show(){
    show(pos);
  }
  
  void step(){
    prevPos = pos.copy();
    pos.add( PVector.mult( dir, stepLength ) );
    background.line( prevPos, pos );
  }
  
  void turn( float aglIn01 ){
    dir.rotate( TAU * aglIn01 );
  }
  
  void lookTowards( float aglIn01 ){
    dir = PVector.fromAngle( TAU * aglIn01 );
  }
}
