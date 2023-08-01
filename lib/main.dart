import 'package:evidenta_smile/utils/googlesheets.dart';
import 'package:evidenta_smile/utils/sheetscolumns.dart';
import 'package:evidenta_smile/views/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SheetsData.init();
  List<Voluntar> voluntari = await SheetsData.getValuesSedinta();
  runApp(EvidentaSmile(voluntari));
}

class EvidentaSmile extends StatelessWidget {
  List<Voluntar> voluntari;
  EvidentaSmile(this.voluntari,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evidenta Smile',
      theme: ThemeData.dark(),
      home: HomePage(voluntari),
    );
  }
}
