class Clock extends Item{
	// Requirement #2: Complete Clock Class

  Clock(float x, float y){
  super(x,y);
  }
      // Display Cabbage
    void display(){
      image(clock, x, y);
    }
    
      // Check collision with player
  void checkCollision(Player player){
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h) && player.health <5){
        gameTimer+=15*60;
        isAlive = false;
        x = y = -1000;
    }else{isAlive=false;}
  }


}
