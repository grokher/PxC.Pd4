class Combat_System{
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
  
  //health potion
  fill (#16DB4C);
  rect (100, 454.5, 100, 35);
  
  fill (#020302);
  textSize (32);
  text (enemyHealth,26,56);
  
  fill (#020302);
  textSize (32);
  text (playerHealth,403,56);
  
  text (potionAmmount, 91, 466);
  
   time = millis()/2000;
   
    if (playerHealth > 100){
    playerHealth = 100;
  }
  
  if (fighting == true){
  if(time - attackInterval == 1)
  {
    playerHealth -= enemyDamage;
    attackInterval++;
  }
}
}

void mouseClicked (){
  if (mouseX > 200 & mouseX < 300 & mouseY > 447 & mouseY < 482){
  enemyHealth -= weaponDamage;
  }
  if (mouseX > 50 & mouseX < 150 & mouseY > 447 & mouseY < 482 & potionAmmount > 0){
    playerHealth += healthPotion;
    potionAmmount -= 1;
}
}
}
