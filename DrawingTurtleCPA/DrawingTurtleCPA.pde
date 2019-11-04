Turtle turtle;
SmartPG background;

color col = #FF9BD5 ;

void setup(){
  noSmooth();
  frameRate( 120 );
  fullScreen();
  //size(400,400);
  background( 0 );
  background = new SmartPG( 3*width , 3*height );
  background.beginDraw();
    background.pg.background(0);
  background.endDraw();
  turtle = new Turtle();
}

void draw(){
  background.show();
  background.show(turtle);
  background.beginDraw();
   for( int _ = 0; _ < 10; ++_ ){
     background.pg.stroke( col ) ;
      //------------------------------------------------------
      turtle.step();
      turtle.turn(0.25);
      //------------------------------------------------------
   }
  background.endDraw();
}

void keyPressed(){
  if( key == 'q' ){
    println("Saving...") ;
    background.pg.save( "screenshots/"+year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png") ;
    println("Saved!") ;
  }
  if( key == 's' ){
    println("Saving...") ;
    background(0);
    background.show();
    save( "screenshots/"+year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png") ;
    println("Saved!") ;
  }
}
