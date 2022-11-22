class Combat_System{
int playerHealth = 100;
int enemyHealth = 500;

void draw (){
  fill (#2CCE99);
  rectMode (CENTER);
  strokeWeight(3);
  
  //placeholder
  rect (250, 250, 250, 250);
  
  fill (#020302);
  textSize (32);
  text (enemyHealth,26,56);
 
  fill (#020302);
  textSize (32);
  text (playerHealth,403,56);
}

void mouseClicked (){
  enemyHealth -= 5;
}
}
//comment
