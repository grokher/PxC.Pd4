class enemyMovement
{
  PImage kappa;
  PImage kitsune;
  PImage jorogumo;
  PImage dragon;
  
  int kappaX,kappaY,kitsuneX,kitsuneY,jorogumoX,jorogumoY,dragonX,dragonY;
  int speed = 2;
  
  boolean isKappa,isKitsune,isJorogumo,isDragon;
  
  public void isFightingKappa(boolean isKappa)
  {
    if(isKappa == true)
    {
      image(kappa,kappaX,kappaY);
      kappaX = 50;
      kappaY = 250;
      
      if(kappaX <= -50)
      {
        kappaX += 1 * speed;
      }
      else if(kappaX >= 450)
      {
        kappaX += -1 * speed;
      }
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
