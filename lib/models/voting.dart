import 'dart:io';

import 'package:flutter/cupertino.dart';

class VoteModel {
  late int product_id;
  late int vote;





  VoteModel(this.product_id, this.vote);
  VoteModel.fromJson(Map<String, dynamic> json)
      :
        product_id = json['product_id'],
        vote = json['vote'];




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = product_id;
    data['vote'] = vote;

    return data;
  }


}