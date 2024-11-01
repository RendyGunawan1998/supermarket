class AssetsHelper {
  static String imgLogo = img("logo.jpg");
  static String imgNoFile = img("nofile.png");
  static String imgMie = img("mie.jpg");
  static String imgOil = img("oil.jpg");
  static String imgSoap = img("soap.jpg");
  static String imgWater = img("water.jpg");

  static String img(String name) {
    return "assets/images/$name";
  }
}
