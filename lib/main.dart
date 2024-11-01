import 'package:supermarket/core_main/pages/splash_screen.dart';

import 'core.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Supermarket Retail')),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           ElevatedButton(
//             onPressed: () => Get.to(SalesTransactionPage()),
//             child: Text('Sales Transaction'),
//           ),
//           ElevatedButton(
//             onPressed: () => Get.to(ProductSettingsPage()),
//             child: Text('Product Settings'),
//           ),
//           ElevatedButton(
//             onPressed: () => Get.to(InputStockPage()),
//             child: Text('Input Stock / Purchase'),
//           ),
//           ElevatedButton(
//             onPressed: () => Get.to(SalesReportPage()),
//             child: Text('Sales Report'),
//           ),
//         ],
//       ),
//     );
//   }
// }
