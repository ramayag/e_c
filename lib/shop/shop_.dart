import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce_ui_kit/callApi.dart';
import 'package:flutter_ecommerce_ui_kit/models/getNewProduct.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_ecommerce_ui_kit/shop/search_image.dart';

import 'search.dart';
import 'search_image.dart';

List<ProductModel> product = <ProductModel>[];
class Shop_ extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop_> {
  double ra=5;
  File ? _imageFile;

  final ImagePicker _picker = ImagePicker();

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


  ///////lana///
  List<ProductModel> _product= <ProductModel>[];
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
    var response = await CallApi().getdata('products');
    // print(response.body);
    var product = <ProductModel>[];
    var item = json.decode(response.body);
    print(item);

    for (var i in item) {
      product.add(ProductModel.fromJson(i));
      print("iam heeeeeerererrerre");
    }

    return product;
  }



  ////////lana////



  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              scaffoldKey.currentState!
                  .showBottomSheet((context) => ShopSearch());
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.white),
            onPressed: ()  {
              takePhoto(ImageSource.gallery);
              //     // print(_imagefile!.path);
              //     // if(_imagefile!=null){
                  }
              // //},
            )
        ],
        title: Text('Shop'),

      ),
      body: Container(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
          children: List.generate(_product.length, (index) {
            return Container(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    print('Card tappedyyy.');
                    Navigator.pushNamed(
                        context, '/products',
                        arguments: _product[index]);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: (MediaQuery.of(context).size.width / 2 - 15),
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: 'http://192.168.43.121:8000/upload/${_product[index].image}',
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator()
                          ),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: ListTile(
                          title: Text(
                            _product[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                    child: Text('${_product[index].sell_price}'
                                                        , style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),

                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SmoothStarRating(

                                      allowHalfRating: false,
                                      onRated: (v) {
                                        ra = v;
                                        print(v);
                                        setState(() {});
                                      },
                                      starCount: 5,
                                      rating: ra,
                                      size: 16.0,
                                      color: Colors.amber,
                                      borderColor: Colors.amber,
                                      spacing:0.0
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Text(ra.toString(), style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor
                                    )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),





    );
  }

  Future takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    if(pickedFile==null)
      return;
    setState(() {
      //_imageFile = pickedFile ;
      _imageFile=File(pickedFile.path);
      print("ddddddddddddd");
      print(_imageFile);
      print(pickedFile.path);
      Navigator.pop(context,{_imageFile});
      Navigator.pushNamed(
          context, '/search_image',
          arguments: _imageFile
      );
    });
  }

// _pickFromGallery() async {
//   PickedFile? image = await ImagePicker().getImage(source: ImageSource.gallery);
//   //  .pickImage(source: ImageSource.gallery, imageQuality: 100);
//   // _imagefile = File(image!.path);
//   setState(() {
//     _imagefile = File(image!.path);
//     print("///////////////////");
//     print(_imagefile?.uri);
//     print(image.path.toString());
//     print(image);
//     if(_imagefile!=null){
//       Navigator.pop(context,{_imagefile});
//       Navigator.pushNamed(
//           context, '/search_image',
//           arguments: _imagefile
//       );}
//   });
//
// }
}
