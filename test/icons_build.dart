import 'dart:convert';
import 'dart:io';


Future<void> main() async {
  // String jsonString = await rootBundle.loadString('assets/fonts/iconfont.json');
  final file = File('assets/fonts/iconfont.json');
  final jsonString = await file.readAsString();
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  jsonMap['glyphs'].forEach((item) {
    print('static final IconData ${item["name"][0].toLowerCase() + item["name"].substring(1)} = const AntIconData(${item['unicode_decimal']});');
  });
}