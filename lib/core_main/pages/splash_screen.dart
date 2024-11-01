import '../../core.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateRoute();
  }

  navigateRoute() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Image.asset(
              AssetsHelper.imgLogo,
              width: 150.0,
              height: 150.0,
            ),
          ),
        ));
  }
}
