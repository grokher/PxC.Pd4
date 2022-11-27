import processing.sound.*;

int wwidth = 800;
int wheight = 600;

Combat_System combatSystem;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();
SoundFile button1,button2,slash, punch;

int x;
int y;


void settings()
{
  size(wwidth, wheight, P3D);
}

void setup()
{
  x = (int)random(150,600);
  y = (int)random(150,400);
  
  
 
  button1 = new SoundFile(this, "button1.wav");
  button2 = new SoundFile(this, "button2.wav");
  slash = new SoundFile(this, "swordSlash.wav");
  punch = new SoundFile(this, "punch.wav");
  
  //start of mainMen
  
  Scene mainMenu = new Scene("sceneMainMenu", "player.jpg");
  GameObject weaponKatana = new GameObject("weapon_scene0x", 300,200,300,500, "tempKatana.png");
  TextObject startButton = new TextObject("startText_mainMenu",450,100,50,50,"","Start Game");
  mainMenu.addGameObject(startButton);
  MoveToSceneObject scene01MoveTo = new MoveToSceneObject("goToScene01_sceneMainMenu",450,100,75,75,"clickableObject.png","scene01");
  mainMenu.addGameObject(scene01MoveTo);

  
  //start of scene1 Main game screen
  
  Scene scene01 = new Scene("scene01", "InProgressMap.png");
  MoveToSceneObject forestSceneMoveTo = new MoveToSceneObject("goToScene02_scene01", 0,300,300,300,"clickableObject.png", "scene02");//bottomleft
  scene01.addGameObject(forestSceneMoveTo);
  MoveToSceneObject kitsuneSceneMoveTo = new MoveToSceneObject("goToScene03_scene01", 250,150,300,300, "clickableObject.png", "scene03");//middle
  scene01.addGameObject(kitsuneSceneMoveTo);
  MoveToSceneObject jorogumoSceneMoveto = new MoveToSceneObject("goToScene04_scene01", 0, 0, 300, 300, "clickableObject.png", "scene04"); //topleft
  scene01.addGameObject(jorogumoSceneMoveto);
  MoveToSceneObject lakeSceneMoveTo = new MoveToSceneObject("goToScene05_scene01", 500,300,300,300, "clickableObject.png", "scene05"); //bottomright
  scene01.addGameObject(lakeSceneMoveTo);
  MoveToSceneObject bossSceneMoveTo = new MoveToSceneObject("goToScene06_scene01", 500, 0, 300, 300, "clickableObject.png", "scene06"); //topright
  scene01.addGameObject(bossSceneMoveTo);
  
  //start of scene02 game screen
  
  Scene scene02 = new Scene("scene02", "Mountains.png");
  MoveToSceneObject returnObject1 = new MoveToSceneObject("goBack_scene02", 350, 500, 100, 100, "arrowDownDark.png", true);
  scene02.addGameObject(returnObject1);
  scene02.addGameObject(weaponKatana);
  
  //start of scene03 game screen (Kitsune)  
  
  Scene scene03 = new Scene("scene03", "backKitsune.jpg");
  MoveToSceneObject returnObject2 = new MoveToSceneObject("goBack_scene03", 350, 500, 100, 100, "arrowDownDark.png", true);
  scene03.addGameObject(returnObject2);
  scene03.addGameObject(weaponKatana);
  
  //start of scene04 game screen (Jorogumo)
  Scene scene04 = new Scene("scene04", "backJorogumo.png"); 
  MoveToSceneObject returnObject3 = new MoveToSceneObject("goBack_scene04",350,500,100,100,"arrowDownDark.png", true);
  scene04.addGameObject(returnObject3);
  GameObject enemy01 = new GameObject("enemy_Jorogumo01", wwidth / 4 , wheight / 4,350,250, "enemyJorogumo.png"); 
  scene04.addGameObject(enemy01);
  MoveToSceneObject combatScene = new MoveToSceneObject("goToCombatSceneJorogumo",300 , 150,300,250,"clickableObject.png","combatJorogumo");
  scene04.addGameObject(combatScene);
  scene04.addGameObject(weaponKatana);
  
  //start of scene05 game screen 
  Scene scene05 = new Scene("scene05", "back03.png");
  MoveToSceneObject returnObject4 = new MoveToSceneObject("goback_scene05",350,500,100,100,"arrowDownDark.png", true);
  scene05.addGameObject(returnObject4);
  scene05.addGameObject(weaponKatana);
  
  //start of scene06 game screen
  Scene scene06 = new Scene("scene06", "backBoss01.jpg");
  /*GameObject enemy02 = new GameObject("enemy_Dragon01",75,0,700,650, "enemyDragon.png"); 
  scene06.addGameObject(enemy02);*/
  MoveToSceneObject returnObject05 = new MoveToSceneObject("goback_scene06",350,500,100,100,"arrowDownDark.png", true);
  scene06.addGameObject(returnObject05);
  scene06.addGameObject(weaponKatana);
  
  
  //combat scene with Jorogumo
  Scene sceneCombatJorogumo = new Scene("combatJorogumo", "backJorogumo.png");
  Combat_System jorogumo = new Combat_System("Jorogumo", x , y ,200,200, "enemyJorogumo.png");
  sceneCombatJorogumo.addGameObject(jorogumo);
  GameObject enemy02 = new GameObject("enemy_Jorogumo01",x , y ,200,200, "enemyJorogumo.png"); 
  sceneCombatJorogumo.addGameObject(enemy02);
  MoveToSceneObject returnObject5 = new MoveToSceneObject("goBack_scene04",350,500,100,100,"arrowDownDark.png", true);
  sceneCombatJorogumo.addGameObject(returnObject5);
  
  
  //do sceneManager.addScene(scene0X); to add a new scene to what we already have
  sceneManager.addScene(mainMenu);
  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  sceneManager.addScene(scene03);
  sceneManager.addScene(scene04);
  sceneManager.addScene(scene05);
  sceneManager.addScene(scene06);
  sceneManager.addScene(sceneCombatJorogumo);
}

void draw()
{
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
}
