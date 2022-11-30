import processing.video.*;
import processing.sound.*;

int wwidth = 800;
int wheight = 600;
PImage potion, playButton, inventoryButton, skipButton, gameOver, jorogumoImage, kitsuneImage, kappaImage, dragonImage, deadDragonImage, bowObtained, katanaObtained, saiObtained;
PImage backButton;

//Combat_System combatSystem;
enemyMovement enemyMovement;
Movie cutsceneKitsune, cutsceneJorogumo;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();
SoundFile button1, button2, slash, punch, punch2;

int x;
int y;

boolean kappa, jorogumo, dragon, kitsune;
int kappaHealth = 1;
int kappaDamage = 10;
int jorogumoHealth = 1;
int jorogumoDamage = 15;
int kitsuneHealth = 1;
int kitsuneDamage = 10;
int dragonHealth = 1;
int dragonDamage = 25;

void settings()
{
  size(wwidth, wheight);
}

void setup()
{
  frameRate(60);
  x = 350;
  y = 250;

  enemyMovement = new enemyMovement();
  enemyMovement.kappa = loadImage("kappa.png");
  potion = loadImage("potion.png");
  playButton = loadImage("playButton.png");
  inventoryButton = loadImage ("inventoryButton.png");
  skipButton = loadImage ("skipButton.png");
  gameOver = loadImage ("gameOver.png");
  jorogumoImage = loadImage("jorogumo.png");
  kitsuneImage = loadImage("kitsune.png");
  kappaImage = loadImage("kappa.png");
  dragonImage = loadImage("dragon.png");
  deadDragonImage = loadImage("deadDragon.png");
  bowObtained = loadImage("obtainedBow.png");
  katanaObtained = loadImage("obtainedKatana.png");
  saiObtained = loadImage("obtainedSai.png");

  backButton = loadImage("arrowDownDark.png");

  cutsceneKitsune = new Movie(this, "kitsuneCutscene.mov");
  cutsceneJorogumo = new Movie(this, "jorogumoCutscene.mov");

  button1 = new SoundFile(this, "button1.wav");
  button2 = new SoundFile(this, "button2.wav");
  slash = new SoundFile(this, "swordSlash.wav");
  punch = new SoundFile(this, "hit.wav");
  punch2 = new SoundFile(this, "hit2.wav");

  //start of mainMen
  Scene mainMenu = new Scene("sceneMainMenu", "player.jpg");
  GameObject weaponTanto = new GameObject("weapon_scene0x", 430, 110, 300, 500, "katana.png");
  /*MoveToSceneObject startButton = new MoveToSceneObject("startText_mainMenu",450,100,50,50,"playButton.png","");
   mainMenu.addGameObject(startButton);*/
  MoveToSceneObject scene01MoveTo = new MoveToSceneObject("goToScene01_sceneMainMenu", -300, -170, 900, 700, "playButton.png", "scene01");
  mainMenu.addGameObject(scene01MoveTo);


  //start of scene1 Main game screen

  Scene scene01 = new Scene("scene01", "map.jpg");
  MoveToSceneObject kitsuneSceneMoveTo = new MoveToSceneObject("goToScene03_scene01", 75, 0, 300, 300, "clickableObject.png", "scene03");//topleft kitusune
  scene01.addGameObject(kitsuneSceneMoveTo);
  MoveToSceneObject jorogumoSceneMoveto = new MoveToSceneObject("goToScene04_scene01", 75, 300, 300, 300, "clickableObject.png", "scene04"); //bottomleft jorogumo
  scene01.addGameObject(jorogumoSceneMoveto);
  MoveToSceneObject lakeSceneMoveTo = new MoveToSceneObject("goToScene05_scene01", 375, 0, 300, 300, "clickableObject.png", "scene02"); //topright kappa
  scene01.addGameObject(lakeSceneMoveTo);
  MoveToSceneObject bossSceneMoveTo = new MoveToSceneObject("goToScene06_scene01", 375, 300, 300, 300, "clickableObject.png", "scene06"); //bottomright dragon
  scene01.addGameObject(bossSceneMoveTo);

  //start of scene02 game screen

  Scene scene02 = new Scene("scene02", "backKappa.jpg");
  MoveToSceneObject returnObject1 = new MoveToSceneObject("goBack_scene02", 700, 500, 100, 100, "map.jpg", true);
  scene02.addGameObject(returnObject1);
  GameObject enemyKappa = new GameObject("enemy_Kappa01", 150, 150, 300, 300, "kappa.png");
  scene02.addGameObject(enemyKappa);
  MoveToSceneObject combatSceneKappa = new MoveToSceneObject("goToCombatSceneKappa", 150, 150, 300, 300, "clickableObject.png", "combatKappa");
  scene02.addGameObject(combatSceneKappa);
  scene02.addGameObject(weaponTanto);

  //start of scene03 game screen (Kitsune)  

  Scene scene03 = new Scene("scene03", "backKitsune01.jpg");
  GameObject enemyKitsune = new GameObject("enemy_Kitsune01", 150, 150, 200, 200, "kitsune.png");
  scene03.addGameObject(enemyKitsune);
  MoveToSceneObject combatSceneKitsune = new MoveToSceneObject("goToCombatSceneKitsune", 150, 150, 200, 200, "clickableObject.png", "combatKitsune");
  scene03.addGameObject(combatSceneKitsune);
  scene03.addGameObject(weaponTanto);
  scene03.addGameObject(returnObject1);


  //start of scene04 game screen (Jorogumo)
  Scene scene04 = new Scene("scene04", "backJorogumo.jpg"); 
  GameObject enemy01 = new GameObject("enemy_Jorogumo01", 300, 150, 350, 250, "jorogumo.png"); 
  scene04.addGameObject(enemy01);
  MoveToSceneObject combatSceneJorogumo = new MoveToSceneObject("goToCombatSceneJorogumo", 300, 150, 300, 250, "clickableObject.png", "combatJorogumo");
  scene04.addGameObject(combatSceneJorogumo);
  scene04.addGameObject(weaponTanto);
  scene04.addGameObject(returnObject1);

  //start of scene05 game screen (boss)
  Scene scene05 = new Scene("scene06", "backDragon.jpg");
  GameObject enemyDragon = new GameObject("enemy_Dragon01", 75, 0, 550, 450, "dragon.png");
  scene05.addGameObject(enemyDragon);
  MoveToSceneObject combatSceneDragon = new MoveToSceneObject("goToCombatSceneDragon", 200, 0, 400, 450, "clickableObject.png", "combatDragon");
  scene05.addGameObject(combatSceneDragon);
  scene05.addGameObject(weaponTanto);
  scene05.addGameObject(returnObject1);


  //combat scene with kappa
  Scene sceneCombatKappa = new Scene("combatKappa", "backKappa.jpg");
  combatKappa kappa = new combatKappa("hitbox_Kappa", 800, 800, 0, 0, "kappa.png", kappaHealth, kappaDamage);
  sceneCombatKappa.addGameObject(kappa);

  //combat scene with kitsune
  combatKitsune hitboxKitsune = new combatKitsune("hitboxKitsune", 2000, 2000, 200, 200, "kitsune.png", kitsuneHealth, kitsuneDamage);
  Scene sceneCombatKitsune = new Scene("combatKitsune", "backKitsune01.jpg");
  sceneCombatKitsune.addGameObject(hitboxKitsune);

  //combat scene with Jorogumo
  Scene sceneCombatJorogumo = new Scene("combatJorogumo", "backJorogumo.jpg");
  combatJorogumo hitboxJorogumo = new combatJorogumo("Jorogumo", 800, 800, 200, 200, "jorogumo.png", jorogumoHealth, jorogumoDamage);
  sceneCombatJorogumo.addGameObject(hitboxJorogumo);

  //combat scene with dragon
  Scene sceneCombatDragon = new Scene("combatDragon", "backDragon.jpg"); // need finished? background
  combatDragon hitboxDragon = new combatDragon("hitbox_dragon", 800, 800, 550, 500, "dragon.png", dragonHealth, dragonDamage);
  sceneCombatDragon.addGameObject(hitboxDragon);
  //add Dragon combatSystem

  //do sceneManager.addScene(scene0X); to add a new scene to what we already have
  sceneManager.addScene(mainMenu);
  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  sceneManager.addScene(scene03);
  sceneManager.addScene(scene04);
  sceneManager.addScene(scene05);
  sceneManager.addScene(sceneCombatJorogumo);
  sceneManager.addScene(sceneCombatKappa);
  sceneManager.addScene(sceneCombatKitsune);
  sceneManager.addScene(sceneCombatDragon);
}

void draw()
{
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  if (enemyMovement.isKappa == true)
  {
    isInCombat();
  }
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
}
void movieEvent(Movie m) {
  m.read();
}
void isInCombat()
{
  enemyMovement.isKappa = true;
  enemyMovement.kappaX = x;
}
