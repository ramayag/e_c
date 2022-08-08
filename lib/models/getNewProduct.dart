import 'dart:io';

import 'package:flutter/cupertino.dart';

class ProductModel {
  late int id;
  late String name;
  late int sell_price;
  late String size;
  late String color;
  late String description;
  late int total_q;
  late String image;
  late int brand_id;
  late int category_id;
  late int vote_count;


 ProductModel(this.id, this.name, this.sell_price, this.size,
      this.color, this.description, this.total_q, this.image,this.brand_id,this.category_id,this.vote_count);
  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        sell_price = json['sell_price'],
        size = json['size'],
        color = json['color'],
        description = json['description'],
        total_q = json['total_q'],
        image = json['image'],
        brand_id = json['brand_id'],
        category_id = json['category_id'],
        vote_count = json['vote_count'];



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['sell_price'] = sell_price;
    data['size'] = size;
    data['color'] = color;
    data['description'] = description;
    data['total_q'] = total_q;
    data['image'] = image;
    data['brand_id'] = brand_id;
    data['category_id'] = category_id;
    data['vote_count'] = vote_count;

    return data;
  }
}