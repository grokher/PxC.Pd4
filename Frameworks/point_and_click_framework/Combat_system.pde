class Combat_System extends GameObject { //<>//
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

  void draw () {
    if (fighting == false){
      playerHealth = 120;
    }

    if(fighting == true){
      //health potion button
      rectMode (CENTER);
      fill (#16DB4C);
      rect (114, 546.0, 153, 65);

      fill (#020302);
      textSize (32);
      text ("enemy " + enemyHealth, 26, 56);

      fill (#020302);
      textSize (32);
      text ("player " + playerHealth, 621, 56);

      text (potionAmmount, 103, 561);
    }
    
      if (enemyHealth < 1) {
        fighting = false;
      }
      if (enemyHealth < 1) {
        enemyHealth = 0;
      }

      if (playerHealth > 120) {
        playerHealth = 120;
      }

      if (playerHealth < 1) {
        playerHealth = 0;
      }

      time = millis()/2000;

      if (time - attackInterval >= 1 && enemyHealth > 0){
        println("reaching the player damage");
        playerHealth -= enemyDamage;
        punch.play();
        punch.amp(0.5);
        attackInterval++;
      }
      
      if (fighting == false){
        punch.stop();
      }
  }

  void mouseClicked () {
    if (mouseIsHovering & playerHealth > 0) {
      enemyHealth -= weaponDamage;
      fighting = true;
      println("reaching the enemy damage");
    }
    if (mouseX > 37.4 & mouseX < 190.6 & mouseY > 513.5 & mouseY < 578.5 & potionAmmount > 0 & playerHealth > 0) {
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
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.gameObjectImage = loadImage(gameObjectImageFile);
  }
}
