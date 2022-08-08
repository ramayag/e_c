import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/callApi.dart';
import 'package:flutter_ecommerce_ui_kit/models/getNewProduct.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';




class Products extends StatefulWidget {

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {




  @override
  Widget build(BuildContext context) {
     ProductModel  product = ModalRoute.of(context)!.settings.arguments as ProductModel;
     print(product.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                width: double.infinity,
                  height: 260,
                  child: Hero(
                    tag: 'http://10.0.2.2:8000/image/${product.image}',
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: 'http://10.0.2.2:8000/image/${product.image}',
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            product.name!=null?product.name:'',
                            style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    '${product.sell_price}',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: <Widget>[
                                RatingStars(
                                  value: 5,
                                  starSize: 16,
                                  valueLabelColor: Colors.amber,
                                  starColor: Colors.amber,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                    'Description',
                                  style: TextStyle(color: Colors.black, fontSize: 20,  fontWeight: FontWeight.w600),
                                ),
                              )
                          ),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  product.description!=null?product.description:''
                                 , style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}
