import 'dart:convert';
import 'dart:io';

class Utils {
  static T? tryCast<T>(obj) {
    try {
      if (obj is T) {
        return obj;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static loadJsonFile({required String filePath}) {
    try {
      final file = File(filePath);
      final json = jsonDecode(file.readAsStringSync());
      return json;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
