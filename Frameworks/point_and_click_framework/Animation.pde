class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count*10;
    images = new PImage[imageCount];
    int threshold = 10;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + ((threshold-10)/10) + ".png";
      images[i] = loadImage(filename);
      if(i == threshold){
        threshold += 10;
      }
    }
    
  }

  void display(float xpos, float ypos,float IWidth, float IHeight) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos,IWidth,IHeight);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
