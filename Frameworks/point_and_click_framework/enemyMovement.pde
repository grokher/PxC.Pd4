class enemyMovement
{
  PImage kappa;
  PImage kitsune;
  PImage jorogumo;
  PImage dragon;
  
  int kappaX,kappaY,kitsuneX,kitsuneY,jorogumoX,jorogumoY,dragonX,dragonY;
  int speed = 2;
  
  boolean isKappa,isKitsune,isJorogumo,isDragon;
  
  void draw (){
    if(isKappa == true)
    {
      image(kappa,kappaX,kappaY);
      kappaX = 0;
      kappaY = 0;
      
      if(kappaX <= -50)
      {
        kappaX += 1 * speed;
      }
      else if(kappaX >= 450)
      {
        kappaX += -1 * speed;
      }
    }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  }}
