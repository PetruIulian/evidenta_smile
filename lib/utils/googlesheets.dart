import 'package:evidenta_smile/utils/sheetscolumns.dart';
import 'package:gsheets/gsheets.dart';

class SheetsData {
  static const String _sheetID = '';
  static const String _sheetCredentials = r''' 
 {
  
}
  ''';

  static Worksheet? _sheetSedinta;
  static final GSheets _gsheets = GSheets(_sheetCredentials);

  static Future init() async {
    try{
      final Spreadsheet spreadsheet = await _gsheets.spreadsheet(_sheetID);
      _sheetSedinta = await _getWorksheet(spreadsheet, title: 'Smile Sibiu - Prezenta Sedinte');
    }catch(e){
      print(e);
    }

  }

  static Future<Worksheet> _getWorksheet(
    Spreadsheet spreadsheet,
    {required String title,}
  ) async {
    try{
        return await spreadsheet.addWorksheet(title);
    } catch (e){
        return await spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<List<Voluntar>> getValuesSedinta() async {
    final List<Map<String, String>>? values = await _sheetSedinta?.values.map.allRows();
    List<Voluntar> voluntari = <Voluntar>[];
    if (values != null){
       values.forEach((Map<String, String> element) => {
         voluntari.add(new Voluntar(id: element['Nr.']!, nume: element['NUME']!, ianuarie: element['IANUARIE']!, februarie: element['FEBRUARIE']!, martie: element['MARTIE']!, aprilie: element['APRILIE']!, mai: element['MAI']!, iunie: element['IUNIE']!, iulie: element['IULIE']!, august: element['AUGUST']!, septembrie: element['SEPTEMBRIE']!, octombrie: element['OCTOMBRIE']!, noiembrie: element['NOIEMBRIE']!, decembrie: element['DECEMBRIE']!, prezente: element['PREZENTE']!))
       });
       return voluntari;
    }
    else{
      return voluntari;
    }
  }
}