import '../../core.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final pages = [
    SallesTranscationScreen(),
    ProductSettingScreen(),
    SalesReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 75,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  pageIndex == 0
                      ? columnNavBarAktif(
                          'Transaction', Icons.upload_file_rounded, () {})
                      : columnNavBar('Transaction', Icons.upload_file, () {
                          setState(() {
                            pageIndex = 0;
                          });
                        }),
                  Container(),
                  pageIndex == 1
                      ? columnNavBarAktif('Product', Icons.table_chart, () {})
                      : columnNavBar('Product', Icons.table_chart_outlined, () {
                          setState(() {
                            pageIndex = 1;
                          });
                        }),
                  Container(),
                  pageIndex == 2
                      ? columnNavBarAktif('Report', Icons.receipt_long, () {})
                      : columnNavBar('Report', Icons.receipt_long_outlined, () {
                          setState(() {
                            pageIndex = 2;
                          });
                        }),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
