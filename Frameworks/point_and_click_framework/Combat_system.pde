class Combat_System{
int playerHealth = 100;
int enemyHealth = 500;
int enemyDamage = 5;
int weaponDamage = 5;

int attackInterval = 1;
int time;
int localTime;
boolean fighting = true;

void draw (){
  fill (#020302);
  textSize (32);
  text (enemyHealth,26,56);
  
  fill (#020302);
  textSize (32);
  text (playerHealth,403,56);
  
   time = millis()/1000;
  
  if (fighting == true){
  if(time - attackInterval == 1)
  {
    playerHealth -= enemyDamage;
    attackInterval++;
  }
}
}

void mouseClicked (){
  enemyHealth -= weaponDamage;
}
}
