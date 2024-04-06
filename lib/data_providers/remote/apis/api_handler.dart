import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/constants.dart';
import '../../local/cache_helper.dart';

class APIHandler {
  static Future<void> getApi({
    required String url,
    required Function result,
  }) async {
    String? userToken = CacheHelper.getDataFromSharedPreference(
        key: AppSharedPref.userToken.name);
    
      var response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $userToken'},
      );
    
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);

      result(response.statusCode, map);
    } else {
      result(response.statusCode, {});
    }

  }


  static Future<void> postApi(
      {required String url,
      required Map<String, dynamic>? body,
      String? userToken,
      required Function result}) async {
    try {
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $userToken'}, body: body);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        result(response.statusCode, map);
      } else {
        result(response.statusCode, jsonDecode(response.body));
        print("PostApi status !=200 body: ${response.body}");
      }
    } catch (e) {
      result(500, e.toString());
      print("Error from postApi: $e");
    }
  }
}
