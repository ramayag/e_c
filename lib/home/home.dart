import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/callApi.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/models/getNewProduct.dart';

import 'drawer.dart';
import 'slider.dart';

List<ProductModel> product = <ProductModel>[];
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://martinvalen.com/13249-large_default/chunky-sneakers-shoes-white-black.jpg',
    'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0d%2F2a%2F0d2a3fe0737172087a7f5fd5f5898ae8b443769d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
    'https://assets.ajio.com/medias/sys_master/root/20210403/1V0O/606861eff997dd7b645d1800/-473Wx593H-461088468-blue-MODEL.jpg',
    'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F42%2F73%2F4273adb72518d43696a1d8b8cf83d411a32f62d1.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_dresses_camidresses%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtTrlSpzJs5fw0Ztj79ol-KNHuKE80-L68HA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuPZRCLf6Y47Obx6R5RVDKTkwnRiGw1bVRMg&usqp=CAU'
  ];




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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                // title: Text('asdas'),
                // pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: HomeSlider(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text(
                            AppLocalizations.of(context)!
                                .translate('NEW_ARRIVALS') ?? '',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: 240.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _product.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                            return Container(
                            width: 140.0,
                            child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                            onTap: () {
                            Navigator.pushNamed(
                            context, '/products',
                            arguments:ProductModel(_product[index].id,_product[index]. name,_product[index]. sell_price,_product[index]. size,_product[index]. color,_product[index]. description, _product[index].total_q,_product[index]. image, _product[index].brand_id,_product[index]. category_id,_product[index].vote_count) );
                            },
                            child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                            SizedBox(
                            height: 160,
                            child: Hero(
                            tag: '$index',
                            child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:'http://10.0.2.2:8000/image/${_product[index].image}' ,
                            placeholder: (context, url) =>
                            Center(
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
                              subtitle: Text('${_product[index].sell_price}',
                              style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme.secondary,
                              fontWeight:
                              FontWeight.w700)),
                              )
                              ],
                              ),
                              ),
                              ),
                              );}



                              ),
                              ),







                          Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-1.png'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text('Shop By Category',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor
                                ),
                                child: Text('View All',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categorise');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: List.generate(4, (index) {
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    print('Card tapped.');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                70,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: imgList[index],
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                        'Two Gold Rings',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-2.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }
}
