// Category_page

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/callApi.dart';
import 'package:flutter_ecommerce_ui_kit/models/getCatigorie.dart';
import 'package:flutter_ecommerce_ui_kit/models/getNewProduct.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

List<ProductModel> product = <ProductModel>[];

class Category_page extends StatefulWidget {
  final CatModel catt;
  Category_page(this.catt);

  @override
  State<Category_page> createState() => _Category_page_State();
}

class _Category_page_State extends State<Category_page> {
  double ra = 5;
  // final List<Map<dynamic, dynamic>> products = [
  //   {'name': 'IPhone', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'},
  //   {'name': 'IPhone X 2', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
  //   {'name': 'IPhone 12', 'rating': 5.0, 'image': 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'},
  // ];
  List<ProductModel> _product = <ProductModel>[];
  void initState() {
    _FetchProuduct().then((value) {
      setState(() {
        _product.addAll(value);
        product.clear();
        product.addAll(value);
      });
    });

    super.initState();
  }

  Future<List<ProductModel>> _FetchProuduct() async {
    print("waaaaaw");
    print(widget.catt.id);
    print("waaaaaw");

    var response =
        await CallApi().getdata('products/in_category/${widget.catt.id}');
    print('products/in_category/${widget.catt.id}');
    print(response.body);

    var product = <ProductModel>[];
    var item = json.decode(response.body);

    for (var i in item) {
      product.add(ProductModel.fromJson(i));
      print("iam heeeeeerererrerre");
    }

    return product;
  }

  @override
  Widget build(BuildContext context) {
    // widget.cat = ModalRoute.of(context)!.settings.arguments as CatModel;
    print(widget.catt.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.catt.name}'),
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
                height: 200,
                child: Hero(
                  tag: 'http://192.168.43.121:8000/categories/${widget.catt.image}',
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'http://192.168.43.121:8000/categories/${widget.catt.image}',
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
                    // Container(
                    //   alignment: Alignment(-1.0, -1.0),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 15, bottom: 15),
                    //     child: Text(
                    //       cat.name!=null?cat.name:'',
                    //       style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    // ),

                    ///////////////////////
                    Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment(-1.0, -1.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                              child: Text(
                                'Suggestion',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            padding: EdgeInsets.only(
                                top: 8, left: 6, right: 6, bottom: 12),
                            children: List.generate(_product.length, (index) {
                              return Container(
                                width: 140.0,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/products',
                                          arguments: ProductModel(
                                              _product[index].id,
                                              _product[index].name,
                                              _product[index].sell_price,
                                              _product[index].size,
                                              _product[index].color,
                                              _product[index].description,
                                              _product[index].total_q,
                                              _product[index].image,
                                              _product[index].brand_id,
                                              _product[index].category_id,
                                              _product[index].vote_count));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 140,
                                          child: Hero(
                                            tag: '$index',
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  'http://192.168.43.121:8000/upload/${_product[index].image}',
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            _product[index].name,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          subtitle: Text(
                                              '${_product[index].sell_price}',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.w700)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
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
