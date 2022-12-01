class inventory extends GameObject 
{
  boolean inventoryOpen = true;
  boolean hasItemInv;
  int tantoDamage = 5;
  int bowDamage = 10;
  int katanaDamage = 15;
  int saiDamage = 20;

  combatKitsune combatKitsune;
  combatJorogumo combatJorogumo;
  combatDragon combatDragon;
  combatKappa combatKappa;

    void draw () {

      if (inventoryOpen == true & mouseX < 352 & mouseX > 106 & mouseY < 299 & mouseY > 157 & mousePressed == true) {
        combatKitsune.weaponDamage = tantoDamage;
        combatKappa.weaponDamage = tantoDamage;
        combatJorogumo.weaponDamage = tantoDamage;
        combatDragon.weaponDamage = tantoDamage;


        inventoryOpen = false;
      }
      if (inventoryOpen == true & mouseX < 692 & mouseX > 441 & mouseY < 300 & mouseY > 156 & mousePressed == true /*& combatKappa.obtainedBow == true*/) {
        combatKitsune.weaponDamage = bowDamage;
        combatKappa.weaponDamage = bowDamage;
        combatJorogumo.weaponDamage = bowDamage;
        combatDragon.weaponDamage = bowDamage;

        inventoryOpen = false;
      }
      if (inventoryOpen == true & mouseX < 352 & mouseX > 106 & mouseY < 488 & mouseY > 342 & mousePressed == true /*& combatKitsune.obtainedKatana == true*/) {
        combatKitsune.weaponDamage = katanaDamage;
        combatKappa.weaponDamage = katanaDamage;
        combatJorogumo.weaponDamage = katanaDamage;
        combatDragon.weaponDamage = katanaDamage;

        inventoryOpen = false;
      }
      if (inventoryOpen == true & mouseX < 693 & mouseX > 446 & mouseY < 488 & mouseY > 342 & mousePressed == true /*& combatJorogumo.obtainedSai == true*/) {
        combatKitsune.weaponDamage = saiDamage;
        combatKappa.weaponDamage = saiDamage;
        combatJorogumo.weaponDamage = saiDamage;
        combatDragon.weaponDamage = saiDamage;

        inventoryOpen = false;
      }
    }
    public inventory(String identifier, int x, int y, int owidth, int oheight)
    {
      this(identifier, x, y, owidth, oheight, true);
    }
    public inventory(String identifier, int x, int y, int owidth, int oheight, boolean hasItem)
    {
      super(identifier, x, y, owidth, oheight, "");
      this.hasItemInv = hasItem;
    }
  }
