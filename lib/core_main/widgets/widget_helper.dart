import '../../core.dart';

Widget hbox(double h) {
  return SizedBox(
    height: h,
  );
}

Widget wbox(double w) {
  return SizedBox(
    width: w,
  );
}

Widget textField(TextEditingController cont, String label) {
  return TextField(
    controller: cont,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        labelText: label),
  );
}

Widget textFieldWithType(
    TextEditingController cont, String label, TextInputType type) {
  return TextField(
    controller: cont,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      labelText: label,
    ),
    keyboardType: type,
  );
}

Widget buttonRounded(String judul, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      height: 40,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: HexColor('#7BB6D6')),
      child: Center(
        child: Text(
          judul,
          style: gFontInter(Colors.white, 15, FontWeight.w500),
        ),
      ),
    ),
  );
}

appbar(String judul) {
  return AppBar(
    backgroundColor: HexColor('#7BB6D6'),
    title: Text(
      judul,
      style: gFontInter(Colors.black, 18, FontWeight.w600),
    ),
    centerTitle: true,
    elevation: 10,
  );
}

Widget columnNavBar(String judul, IconData icon, Function() function) {
  return InkWell(
    onTap: function,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        hbox(3),
        Text(judul,
            textAlign: TextAlign.center,
            style: gFontInter(HexColor('#64748B'), 12, FontWeight.w500)),
      ],
    ),
  );
}

Widget columnNavBarAktif(String judul, IconData icon, Function() function) {
  return InkWell(
    onTap: function,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        hbox(3),
        Text(judul,
            textAlign: TextAlign.center,
            style: gFontInter(Colors.black, 12, FontWeight.w500)),
      ],
    ),
  );
}

Text textJudulDialog(String judul) {
  return Text(
    judul,
    style: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
  );
}

TextStyle gFontInter(Color colors, double size, FontWeight fw) {
  return GoogleFonts.inter(
      textStyle: TextStyle(color: colors, fontSize: size, fontWeight: fw));
}

Column noFile(String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        AssetsHelper.imgNoFile,
        height: 90,
      ),
      hbox(6),
      Text(
        text,
        textAlign: TextAlign.center,
        style: gFontInter(Colors.black, 12, FontWeight.bold),
      ),
    ],
  );
}

Expanded salesTransactionData(
    int flex, String judul1, String judul2, String judul3) {
  return Expanded(
    flex: flex,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(judul1), Text(judul2)],
          ),
          // Text('Product Name : ${data.}'),
          Text(judul3),
        ],
      ),
    ),
  );
}

Expanded salesreport(int flex, String judul1, String judul2, String judul3) {
  return Expanded(
    flex: flex,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul1), Text(judul2),
          // Text('Product Name : ${data.}'),
          Text(judul3),
        ],
      ),
    ),
  );
}

Expanded productSettingData(int flex, String judul1, String judul2,
    String judul3, Function() func1, Function() func2, Function() func3) {
  return Expanded(
    flex: flex,
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul1),
          Text(judul2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(judul3),
              wbox(8),
              InkWell(
                onTap: func3,
                child: Icon(
                  Icons.edit_note,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: func1,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: func2,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

imageProduct(String name, num number) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      topLeft: Radius.circular(15),
    ),
    child: Image.asset(
      fit: BoxFit.fitHeight,
      width: Get.width * number,
      name.contains('Mie')
          ? AssetsHelper.imgMie
          : name.contains('Sabun')
              ? AssetsHelper.imgSoap
              : name.contains('Minyak')
                  ? AssetsHelper.imgOil
                  : AssetsHelper.imgWater,
    ),
  );
}

Row rowButtonDialog(BuildContext context, String judul, Function() funcYes) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: funcYes,
        child: Text(
          judul,
          style: TextStyle(fontSize: 12),
        ),
      ),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close', style: TextStyle(fontSize: 12)))
    ],
  );
}

DropdownButton<String> dropDownFilter(String judul, String? value,
    List<DropdownMenuItem<String>>? items, void Function(String?)? onChanged) {
  return DropdownButton<String>(
      hint: Text(judul),
      isExpanded: true,
      value: value,
      iconEnabledColor: Colors.black,
      items: items,
      onChanged: onChanged);
}

Padding dialogProduct(
    BuildContext context,
    TextEditingController name,
    TextEditingController price,
    TextEditingController stock,
    String judulButton,
    Function() funcButton) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        hbox(15),
        textJudulDialog(judulButton),
        hbox(10),
        textField(name, 'Product Name'),
        hbox(5),
        textFieldWithType(price, 'Price', TextInputType.number),
        hbox(5),
        textFieldWithType(stock, 'Stock Qty', TextInputType.number),
        hbox(10),
        rowButtonDialog(
          context,
          'Add Product',
          funcButton,
        ),
      ],
    ),
  );
}
