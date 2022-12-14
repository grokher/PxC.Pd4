class combatDragon extends GameObject { //<>//
  int playerHealth = 120;
  int enemyHealth = 250;
  int enemyDamage = 15;
  int weaponDamage = 15;
  int potionAmmount = 3;
  int attackInterval = 1;
  int time;
  int localTime;
  boolean fighting = false;
  int healthPotion = 20;
  PImage gameObjectImage;
  int health;
  float punchSound = random (1);
  boolean gameBeat = false;
  boolean dead = false;
  float x = 10;
  float y = 50;
  float IWidth = 300;
  float IHeight = 200;
  boolean dragonAlive = true;

  void draw () {

    if (fighting == false & dragonAlive == true) {
      playerHealth = 120;

      punch2.amp(0);
      punch.amp(0);

       imageMode (CORNER);
      image(cutsceneDragon, 0, 0);
      cutsceneDragon.play(); 

      imageMode (CENTER);
      strokeWeight (3);
      fill (#030202);
      rectMode (CENTER);
      rect (720, 40, 130, 60);
      image(playButton, 730, 30, 500, 500);

      imageMode (CORNER);
    }

    if (fighting == true) {
      //health potion button
      image(potion, 0, 446);

      fill (#020302);
      textSize (32);
      text ("enemy " + enemyHealth, 26, 56);

      fill (#020302);
      textSize (32);
      text ("player " + playerHealth, 621, 56);

      text (potionAmmount, 100, 569);
      
      //dragon movement swooping in and out
      tint(255,0);
      image(dragonImage, x, y, IWidth, IHeight);
      tint(255,255);
      animation3.display(x - 400 + animation3.getWidth()/2, y, IWidth, IHeight);
      x = 350 + 150 * tan(millis()/500.0f);
      y = 200 + 200 * sin (millis()/1050.0f);
    }

    if (enemyHealth < 1) {
      fighting = false;
      enemyHealth = 0;
      dragonAlive = false;
      gameBeat = true;
      image(finalCutscene, 0, 0);
      finalCutscene.play(); 
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
      exit();
    }

    time = millis()/2000;
    
    //enemy attacks and sounds
    if (time - attackInterval >= 1 && enemyHealth > 0) {
      playerHealth -= enemyDamage;
      punchSound = random (1);

      if (punchSound > 0.5 & playerHealth >0) {
        punch.play();
        punch.amp(0.5);
      }

      if (punchSound < 0.5 & playerHealth >0) {
        punch2.play();
        punch2.amp(0.5);
      }

      attackInterval++;
    }

    if (fighting == false) {
      punch.stop();
    }
  }

  void mouseClicked () {
    if (mouseX > x && mouseX < x + IWidth && mouseY > y && mouseY < y + IHeight && playerHealth > 0) {
      enemyHealth -= weaponDamage;
      slash.play();
    }

    if (mouseX > 22 & mouseX < 136 & mouseY > 467 & mouseY < 581 & potionAmmount > 0 & playerHealth > 0) {
      playerHealth += healthPotion;
      potionAmmount -= 1;
    }
    if (fighting == false & mouseX < 785 & mouseX > 654 & mouseY < 69 & mouseY > 9) {
      fighting = true;
      cutsceneDragon.stop();
    }
    if (fighting == false && mouseX < 500 && mouseX > 400 && mouseY > 500 && mouseY < 600)
    {
      sceneManager.goToPreviousScene();
    }
  }
  public combatDragon(String identifier, int x, int y, int owidth, int oheight)
  {
    this(identifier, x, y, owidth, oheight, "");
  }

  public combatDragon(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.gameObjectImage = loadImage(gameObjectImageFile);
  }

  public combatDragon(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, int health, int damage)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);

    this.enemyHealth = health;
    this.enemyDamage = damage;
  }
}
