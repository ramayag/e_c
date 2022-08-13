import 'dart:io';

import 'package:flutter/cupertino.dart';

class idsModel {
  late  int list;





  idsModel(this.list);
  idsModel.fromJson(Map<String, dynamic> json)
      :
        list = json['list'];



  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['product_id'] = product_id;
  //   data['vote'] = vote;
  //
  //   return data;
  // }


}