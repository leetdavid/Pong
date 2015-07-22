public abstract class GameObject {
  
  //hitbox
  private float hboxX, hboxY;
//  private double posX, posY, pPosX, pPosY;
  private Vector pos, pPos;
  private Color c;
  private boolean constrictToScreen = false;
  
  public GameObject(){
    pos = new Vector();
    pPos = new Vector();
    c = new Color(255,255,255);
  }
  
  public void update() {
//    pPosX = posX;
//    pPosY = posY;
    pPos.setVec(pos);
  }

  public void render(double framestep) {
    c.setFill();
  }
  
  //Get the partial position of the game object's current position usually for rendering
  protected Vector getPartialPos(double framestep) {
    return getPartialPos(pos, pPos, framestep);
  }
  
  protected Vector getPartialPos(Vector vec, Vector pVec, double framestep) {
    return getPartialPos(vec.getX(), vec.getY(), pVec.getX(), pVec.getY(), framestep);
  }

  protected Vector getPartialPos(double x, double y, double px, double py, double framestep) {
    double dx = x - px, dy = y - py;
    return new Vector(px + dx * framestep, py + dy * framestep);
  }
  
  
  
  
  
  
  //Setters
  public GameObject setPos(double x, double y) {
    if(constrictToScreen){
      x = Math.max(hboxX*0.5F, x);
      y = Math.max(hboxY*0.5F, y);
      x = Math.min(width -  hboxX*0.5F, x);
      y = Math.min(height - hboxY*0.5F, y);
    }
    pos.setVec(x, y);
    return this;
  }
  public GameObject setColor(int red, int green, int blue){
    c.setColor(red,green,blue);
    return this;
  }
  public GameObject setHitbox(float x, float y){
    hboxX = x;
    hboxY = y;
    return this;
  }
  public GameObject setConstrictToScreen(boolean b){
    constrictToScreen = b;
    return this;
  }
  public GameObject setPPos(double x, double y){
    pPos.setVec(x,y);
    return this;
  }
  
  //Getters
  public double getPosX(){ return pos.getX(); }
  public double getPosY(){ return pos.getY(); } 
  public Vector getPos() { return pos; }
  public boolean constrictToScreen(){
    return constrictToScreen;
  }
}
