class Cabbage extends Item {

  
  Cabbage(float x, float y){
  super(x,y);
  }

			// Display Cabbage
    void display(){
      image(cabbage, x, y);
    }
    
			// Check collision with player
  void checkCollision(Player player){
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h) && player.health <5){
        player.health++;
        isAlive = false;
        x = y = -1000;
    }else{isAlive=true;}
  }

}
