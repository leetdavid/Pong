class Ball extends GameObject{
  
  public Ball(){
    
  }
  
  public void update(){
    super.update();
  }

  public void render(double framestep){
    super.render(framestep);
    double[] pos = getPartialPos(framestep);
    ellipse((float)pos[0], (float)pos[1], 20, 20);
  }
}
