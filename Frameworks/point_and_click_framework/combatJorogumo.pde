class combatJorogumo extends GameObject { //<>// //<>// //<>// //<>// //<>// //<>//
  int playerHealth = 120;
  int enemyHealth = 250;
  int enemyDamage = 15;
  int weaponDamage = 5;
  int potionAmmount = 3;
  int attackInterval = 1;
  int time;
  int localTime = 0;
  boolean fighting = false;
  int healthPotion = 20;
  PImage gameObjectImage;
  int health;
  float punchSound = random (1);
  boolean jorogumoAlive = true;
  boolean obtainedSai = false;
  boolean dead = false;

  void draw () {
    println (punchSound);
    
    if (fighting == false & jorogumoAlive == true & dead == false){
      playerHealth = 120;
      enemyHealth = 250;
      
      punch2.amp(0);
      punch.amp(0);
      
      imageMode (CORNER);
      image(cutsceneJorogumo, 0, 0);
      cutsceneJorogumo.play(); 

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
    }
    
      if (enemyHealth < 1) {
        fighting = false;
        jorogumoAlive = false;
        enemyHealth = 0;
        obtainedSai = true;
      }

      if (playerHealth > 120) {
        playerHealth = 120;
      }

      if (playerHealth < 1) {
        playerHealth = 0;
        punch2.amp(0);
        punch.amp(0);
        
        fighting = false;
        dead = true;
        image (gameOver, 0, 0);
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
      }
  }

  void mouseClicked () {
    if (mouseIsHovering & playerHealth > 0) {
      enemyHealth -= weaponDamage;
      println("reaching the enemy damage");
    }
    if (mouseX > 22 & mouseX < 136 & mouseY > 467 & mouseY < 581 & potionAmmount > 0 & playerHealth > 0) {
      playerHealth += healthPotion;
      potionAmmount -= 1;
    }
            if (fighting == false & mouseX < 785 & mouseX > 654 & mouseY < 69 & mouseY > 9){
      fighting = true;
      cutsceneJorogumo.stop();
    }
  }
  public combatJorogumo(String identifier, int x, int y, int owidth, int oheight)
  {
    this(identifier, x, y, owidth, oheight, "");
  }

  public combatJorogumo(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.gameObjectImage = loadImage(gameObjectImageFile);
  }
  
  public combatJorogumo(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, int health , int damage)
  {
    super(identifier,x,y,owidth,oheight,gameObjectImageFile);
    
    this.enemyHealth = health;
    this.enemyDamage = damage;
  }
}
