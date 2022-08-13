import 'dart:io';

import 'package:flutter/cupertino.dart';

class loginModel {
  late int id;



  loginModel(this.id);
  loginModel.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'];





}