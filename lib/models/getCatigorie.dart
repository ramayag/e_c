import 'dart:io';

import 'package:flutter/cupertino.dart';

class CatModel {
  late int id;
  late String name;

  late String image;


  CatModel(this.id, this.name,  this.image);
  CatModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],

        image = json['image'];



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;


    return data;
  }
}