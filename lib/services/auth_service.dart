import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_ui_kit/config.dart';
import 'package:flutter_ecommerce_ui_kit/models/loginModel.dart';
import 'package:flutter_ecommerce_ui_kit/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
saveToSharedPreferences(String key, int value) async {
  debugPrint('key is $key, value is $value');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<int> getFromSharedPreferences(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int value = prefs.get(key)as int;
  return value;
}

// saveToSharedPreferences(String key, int value) async {
//   debugPrint('key is $key, value is $value');
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt(key, value);
// }
//
// Future<int> getFromSharedPreferences(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int value = prefs.get(key)as int;
//   return value;
// }

class AuthService {
  final storage = FlutterSecureStorage();
  // Create storage
  Future<Map> login(UserCredential userCredential) async {
    final response = await http.post(Uri.parse('http://192.168.43.110:8000/api/user/login'), body: {
      'email': userCredential.email,
      'password': userCredential.password,



    });

    if (response.statusCode == 200) {


      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));

      loginModel loginiduser=loginModel.fromJson(json.decode(response.body));
      saveToSharedPreferences('user_id', loginiduser.id);
      print("hellow from the other side");
      print(await getFromSharedPreferences('user_id'));
      setUser(response.body);
      print(storage.toString());
      return jsonDecode(response.body);
    } else {
      if (response.statusCode == 403) {
        Fluttertoast.showToast(
            msg: "Invalid Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0);
      }
      // If that call was not successful, throw an error.
//      throw Exception(response.body);
      return jsonDecode(response.body);
    }
  }

  Future<Map> register(User user) async {
    print("hello from the other side");
    final response = await http.post(Uri.parse('http://192.168.43.110:8000/api/users/store'),
        body: {
          'name': user.name,
          'password': user.password,
          'email': user.email,
          'location_id':user.location_id,
          'phone':user.phone


        });
    print("hello from the other side");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: 'Email already exist',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
      // If that call was not successful, throw an error.
//      throw Exception(response.body);
      return jsonDecode(response.body);
    }
  }

  setUser(String value) async {
    await storage.write(key: 'user', value: value);
  }

  getUser() async {
    String? user = await storage.read(key: 'user');
    if (user != null) {
      return jsonDecode(user);
    }
    return {};
  }
  logout() async {
    print("i will delete");
    await storage.delete(key: 'user');
    print(storage !=null);
    print("i am done");
  }
}
