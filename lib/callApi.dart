import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CallApi {
  final String _url = "http://10.0.2.2:8000/api/";

  Future postdata(data, apiUrl) async {
    var token = await getFromSharedPreferences('token');
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json',
        'Content-Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
  }

  Future getdata(apiUrl) async {
    //var token = await getFromSharedPreferences('token');
    var fullUrl = _url + apiUrl;
    final http.Response response = await http.get(
      Uri.parse(fullUrl),
      // headers: {
      //   'Content-type': 'application/json',
      //   'Content-Accept': 'application/json',
      //   'Connection': 'Keep-Alive',
      //   'Authorization': 'Bearer ${token}',
      // },
    );
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}


saveToSharedPreferences(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<String> getFromSharedPreferences(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString(key) ?? '';
  return value;


}
