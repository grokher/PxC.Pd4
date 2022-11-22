int wwidth = 800;
int wheight = 600;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

void settings()
{
  size(wwidth, wheight);
}

void setup()
{
  //start of mainMenu is still empty for now
  
  
  
  //start of scene1 Main game screen
  Scene scene01 = new Scene("scene01", "InProgressMap.png");
  /*RequireObject loupe01 = new RequireObject("requiresApple_scene01", 206, 461, 50, 50, "zoom.png", "You need an Apple before getting here!", apple, object7);
  loupe01.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe01);*/

  TextObject loupe02 = new TextObject("smallText_scene01", 541, 445, 50, 50, "zoom.png", "This object has a text!");
  loupe02.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe02);
  TextObject loupe03 = new TextObject("largeText_scene01", 46, 687, 50, 50, "zoom.png", "This object has a way longer text. It shows that the windows can be of varied size according to the text.");
  loupe03.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe03);
  MoveToSceneObject jorogumoSceneMoveto = new MoveToSceneObject("goToScene02_scene01", 0, 0, 400, 300, "clickableObject.png", "scene04");
  scene01.addGameObject(jorogumoSceneMoveto);
  MoveToSceneObject bossSceneMoveTo = new MoveToSceneObject("goToScene05_scene01", 300, 0, 500, 300, "clickableObject.png", "scene05");
  scene01.addGameObject(bossSceneMoveTo);
  MoveToSceneObject kitsuneSceneMoveTo = new MoveToSceneObject("goToScene03_scene01", 150,150,400,300, "clickableObject.png", "scene03");
  scene01.addGameObject(kitsuneSceneMoveTo);
  
  
  //start of scene02 game screen
  Scene scene02 = new Scene("scene02", "Mountains.png");
  MoveToSceneObject object4 = new MoveToSceneObject("goBack_scene02", 350, 700, 50, 50, "arrowDown.png", true);
  scene02.addGameObject(object4);
  MoveToSceneObject object5 = new MoveToSceneObject("goToScene03_scene02", 441, 494, 50, 50, "arrowUp.png", "scene03");
  scene02.addGameObject(object5);
  
  //start of scene03 game screen (Kitsune)
  Scene scene03 = new Scene("scene03", "backKitsune.jpg");
  /*MoveToSceneObject object5 = new MoveToSceneObject("goBack_scene03", 203, 673, 50, 50, "arrowDown.png", true);
  scene03.addGameObject(object5);
  
  /**CollectableObject object6 = new CollectableObject("apple_scene03", 325, 366, 123, 101, apple);
  scene03.addGameObject(object6);*/
  
  //start of scene04 game screen (Jorogumo)
  Scene scene04 = new Scene("scene04", "backJorogumo.png");
  
  GameObject enemy01 = new GameObject("enemy_Jorogumo01",100,100,500,450, "enemyJorogumo.png"); 
  scene04.addGameObject(enemy01);
  /*TextObject endGame = new TextObject("smallText_scene04", 430, 590, 50, 50, "medal1.png", "Congratulations. You finished the game!");
  scene04.addGameObject(endGame);*/
  
  //start of scene05 game screen (Boss)
  Scene scene05 = new Scene("scene05", "backBoss01.jpg");
  GameObject enemy02 = new GameObject("enemy_Dragon01",75,0,700,650, "enemyDragon.png"); 
  scene05.addGameObject(enemy02);
  
  /*MoveToSceneObject object6 = new MoveToSceneObject("goBack_scene01", 203, 753, 50, 50, "arrowDown.png", true);
  scene05.addGameObject(object6);*/
  
  /*TextObject loupe04 = new TextObject("smallText_scene05", 120, 275, 50, 50, "zoom.png", "Have you checked the apples in that odd house to the right?");
  loupe04.setHoverImage("zoomIn.png");
  scene05.addGameObject(loupe04);
  TextObject loupe05 = new TextObject("smallText_2_scene05", 480, 285, 50, 50, "zoom.png", "Hello! How are you doing?");
  loupe05.setHoverImage("zoomIn.png");
  scene05.addGameObject(loupe05);*/
  
  //do sceneManager.addScene(scene0X); to add a new scene to what we already have
  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  sceneManager.addScene(scene03);
  sceneManager.addScene(scene04);
  sceneManager.addScene(scene05);
  
  /*Collectable apple = new Collectable("apple", "back04_apple.png");
  MoveToSceneObject object7 = new MoveToSceneObject("goToScene04_scene01", 206, 461, 50, 50, "arrowUp.png", "scene04");*/
  
  
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
