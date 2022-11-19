import 'dart:convert';
import 'package:learn_clean_arch/core/constants/strings.dart';
import 'package:learn_clean_arch/core/network/network_interface.dart';
import 'package:http/http.dart' as http;

class HttpHelper implements INetwork {
  @override
  Future get(String endPoint) async {
    try {
      var uri = Uri.parse(Strings.baseUrl + endPoint);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      rethrow;
    }
  }
}
