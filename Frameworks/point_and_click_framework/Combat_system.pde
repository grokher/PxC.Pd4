class Combat_System extends GameObject{
int playerHealth = 100;
int enemyHealth = 200;
int enemyDamage = 15;
int weaponDamage = 5;
int potionAmmount = 3;
int attackInterval = 1;
int time;
int localTime;
boolean fighting = true;
int healthPotion = 20;

void draw (){
   //attack button
  fill (#8B1C1C);
  rect (250, 454.5, 100, 35);
  
  //health potion button
  fill (#16DB4C);
  rect (100, 454.5, 100, 35);
  
  fill (#020302);
  textSize (32);
  text (enemyHealth,26,56);
  
  fill (#020302);
  textSize (32);
  text (playerHealth,403,56);
  
  text (potionAmmount, 91, 466);
  
   time = millis()/1500;
   
    if (playerHealth > 100){
    playerHealth = 100;
  }
   
   if (playerHealth < 1){
    playerHealth = 0;
  }
  
  if (fighting == true){
  if(time - attackInterval == 1 && enemyHealth > 0)
  {
    playerHealth -= enemyDamage;
    attackInterval++;
  }
}
}

void mouseClicked (){
  if (mouseIsHovering & playerHealth > 0){
  enemyHealth -= weaponDamage;
  }
  if (mouseX > 50 & mouseX < 150 & mouseY > 447 & mouseY < 482 & potionAmmount > 0 & playerHealth > 0){
    playerHealth += healthPotion;
    potionAmmount -= 1; 
}
}
public Combat_System(String identifier, int x, int y, int owidth, int oheight)
{
  this(identifier, x, y, owidth, oheight, "");
}

public Combat_System(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile)
{
  super(identifier,x,y,owidth,oheight,"");
}
}
