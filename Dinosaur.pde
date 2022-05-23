class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  boolean sameRow = false;
  
	// HINT: Player Detection in update()
	/*

	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
  float speed = 1f;

  void display(){
    if(speed<0){
      pushMatrix();
      translate(x+w,y);
      scale(-1,1);
      image(dinosaur, 0, 0);
      popMatrix();
    }else{image(dinosaur, x, y);}

  }

  void update(){
    if(player.y==y){
      sameRow = true;
    }else{sameRow = false;}
    
    x += speed;
    if(x >= width ||x <=0) {
      speed*=-1;
    }
    if(sameRow && speed>0 && player.x>x){
    speed = TRIGGERED_SPEED_MULTIPLIER;
    }
    else if(sameRow && speed<0 && player.x<x){
    speed = -TRIGGERED_SPEED_MULTIPLIER;
    }
    
    if(sameRow == false && speed>0){
    speed = 1f;
    }
    else if(sameRow == false && speed<0){
    speed = -1f;
    }

  }

  Dinosaur(float x, float y){
    super(x, y);
  }

}
