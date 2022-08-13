import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/callApi.dart';
import 'package:flutter_ecommerce_ui_kit/models/getNewProduct.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:http/http.dart' as http;


import 'cart.dart';
import 'models/intlist.dart';



ProductModel?  product;
List<ProductModel> productt = <ProductModel>[];

late final int productnumber ;
class Products extends StatefulWidget {


  List<ProductModel> _productSug= <ProductModel>[];


  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  List<ProductModel> _product= <ProductModel>[];


  Future<dynamic> postids(data) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.121:8000/api/return_product'), body:

    {
      data

    }
    );
    return response;
  }




  Future vote(int id) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.121:8000/api/product/vote/'), body: {
      'product_id':id.toString() ,
      'vote': ra.toString()
    });
  }

  Future<List<ProductModel>> _Fetchproductnum(String name) async {
    var response = await CallApi().getdata1('http://192.168.43.121:8001/sugg_recm/${name}');
    print("ttttttttt");
   // print(idsModel.fromJson(json.decode(response.body)));

    var productnum = <int>[];
    var item = json.decode(response.body);

    var product = <ProductModel>[];
    print(item);

    // for (var i in item) {
    //   productnum.add(idsModel.fromJson(i).list);
    //   print("iam heeeeeerererrerre");
    //
    //    var res =postids(productnum);
    //
    //
    //   var product = <ProductModel>[];
    //   var item = json.decode(res.body);
    //   print(item);
    //
    //   for (var i in item) {
    //     product.add(ProductModel.fromJson(i));
    //     print("iam heeeeeerererrerre");
    //   }
    //
    //
    //
    //
    // }



    return product;
  }


  late List<int> productnumber = <int>[];
  double ra=0;



  @override
  Widget build(BuildContext context) {
     ProductModel  product = ModalRoute.of(context)!.settings.arguments as ProductModel;
     print(product.name);
     print("heloooooooooooooooo");
      // _product= _Fetchproductnum(product.name);
     print(productnumber.length);



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
                    tag: 'http://192.168.43.121:8000/upload/${product.image}',
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: 'http://192.168.43.121:8000/upload/${product.image}',
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
                                SmoothStarRating(
                                    allowHalfRating: false,
                                    //////heeeeeeeeereeeee
                                    onRated: (v) {
                                      ra=v;
                                      vote(product.id);
                                      // products['rating'] = v;
                                      //   setState(() {});
                                    },
                                    starCount: 5,
                                    rating:ra,
                                    size: 16.0,
                                    color: Colors.amber,
                                    borderColor: Colors.amber,
                                    spacing:0.0
                                ),
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
                          ),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,30.0,0, 10.0),

                                child: Text(
                                  'Suggestion',
                                  style: TextStyle(color: Colors.black, fontSize: 20,  fontWeight: FontWeight.w600),
                                ),
                              )
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 4,
                            //  childAspectRatio: 0.7,
                            padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
                            children: List.generate(_product.length, (index) {
                              return Container(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      print('Card tappedyyy.');
                                      Navigator.pushNamed(context, '/products',
                                          arguments: index);
                                    },
                                    child:
                                    SizedBox(
                                      // height: (MediaQuery.of(context).size.width / 2 - 5),
                                      // width: double.infinity,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: _product[index].image,
                                        placeholder: (context, url) =>
                                            Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                      ),
                                    ),



                                  ),
                                ),
                              );
                            }),
                          ),
                          Padding(padding: const EdgeInsets.only(bottom: 25),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,

                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),

                                onPressed: () {

                                   CartList.add(product);
                                },
                                child: Text('Add to cart'),
                              )
                          )




                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

      ),
    );
  }
}
