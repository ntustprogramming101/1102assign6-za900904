class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  
  float speed = 2f;
  boolean direct;
  boolean nearRow = false;
	// HINT: Player Detection in update()

  void display(){
    if(direct){
      pushMatrix();
      translate(x+w,y);
      scale(-1,1);
      image(robot, 0, 0);
      popMatrix();
    }else{image(robot, x, y);}
  }
  
  void update(){
    x += speed;
    if(x >= width ||x <=0) {
      speed*=-1;
    }
    if(speed<0) direct = true;
    if(speed>0) direct = false;
    if(y-SOIL_SIZE*2<=player.y && y+SOIL_SIZE*2>=player.y){
    nearRow=true;
    }else{nearRow=false;}
    
    if(nearRow){
      speed = 0;
    }
  }
  
    Robot(float x, float y){
    super(x, y);
  }
	/*


	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
