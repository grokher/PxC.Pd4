class combatKitsune extends GameObject { //<>// //<>// //<>// //<>// //<>// //<>//
  int playerHealth = 120;
  int enemyHealth = 250;
  int enemyDamage = 15;
  int weaponDamage = 5;
  int potionAmmount = 3;
  int attackInterval = 1;
  int time;
  int localTime;
  boolean fighting = false;
  int healthPotion = 20;
  PImage gameObjectImage;
  int health;
  float punchSound = random (1);
  boolean kitsuneAlive = true;
  boolean obtainedKatana = false;
  boolean dead = false;
  float IHeight = 200;
  float IWidth = 200;
  float x = 200;
  float y = 200;

  void draw () {
    if (fighting == false & kitsuneAlive == true & dead == false){
      playerHealth = 120;
      enemyHealth = 250;
      
      punch2.amp(0);
      punch.amp(0);
      
      imageMode (CORNER);
      image(cutsceneKitsune, 0, 0);
      cutsceneKitsune.play();
      
      imageMode (CENTER);
      strokeWeight (3);
      fill (#030202);
      rectMode (CENTER);
      rect (720, 40, 130, 60);
      image(playButton, 730, 30, 500, 500);
      
      imageMode (CORNER);
    }

    if(fighting == true){
      //health potion button
      image(potion, 0, 446);

      fill (#020302);
      textSize (32);
      text ("enemy " + enemyHealth, 26, 56);

      fill (#020302);
      textSize (32);
      text ("player " + playerHealth, 621, 56);

      text (potionAmmount, 100, 569);
      
      image(kitsuneImage,x,y,IWidth,IHeight);
      x = 350 + 200 * cos(millis()/200.0f);
      y = 200 + 200 * sin (millis()/650.0f);
      println(y);
    }
    
      if (enemyHealth < 1) {
        fighting = false;
          enemyHealth = 0;
          kitsuneAlive = false;
          obtainedKatana = true;
      }

      if (playerHealth > 120) {
        playerHealth = 120;
      }

      if (playerHealth < 1) {
        playerHealth = 0;
        punch2.amp(0);
        punch.amp(0);
        
        dead = true;
        fighting = false;
        image (gameOver, 0, 0);
        exit();
      }

      time = millis()/2000;

      if (time - attackInterval >= 1 && enemyHealth > 0){
        println("reaching the player damage");
        playerHealth -= enemyDamage;
        punchSound = random (1);
        
        if (punchSound > 0.5 & playerHealth >0){
        punch.play();
        punch.amp(0.5);
        }
        
        if (punchSound < 0.5 & playerHealth >0){
        punch2.play();
        punch2.amp(0.5);
        }
        
        attackInterval++;
      }
      
      if (fighting == false){
        punch.stop();
        punch2.stop();
      }
  }

  void mouseClicked () {
      if (mouseX > x && mouseX < x + IWidth && mouseY > y && mouseY < y + IHeight && playerHealth > 0) {
      enemyHealth -= weaponDamage;
      println("reaching the enemy damage");
    }
    if (mouseX > 22 & mouseX < 136 & mouseY > 467 & mouseY < 581 & potionAmmount > 0 & playerHealth > 0) {
      playerHealth += healthPotion;
      potionAmmount -= 1;
    }
    if (fighting == false & mouseX < 785 & mouseX > 654 & mouseY < 69 & mouseY > 9){
      fighting = true;
      cutsceneKitsune.stop();
    }
  }
  public combatKitsune (String identifier, int x, int y, int owidth, int oheight)
  {
    this(identifier, x, y, owidth, oheight, "");
  }

  public combatKitsune(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.gameObjectImage = loadImage(gameObjectImageFile);
  }
  
  public combatKitsune(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, int health , int damage)
  {
    super(identifier,x,y,owidth,oheight,gameObjectImageFile);
    
    this.enemyHealth = health;
    this.enemyDamage = damage;
  }
}
