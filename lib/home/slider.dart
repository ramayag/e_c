import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  final List<String> imgList = [
    'https://martinvalen.com/13249-large_default/chunky-sneakers-shoes-white-black.jpg',
    'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0d%2F2a%2F0d2a3fe0737172087a7f5fd5f5898ae8b443769d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
    'https://assets.ajio.com/medias/sys_master/root/20210403/1V0O/606861eff997dd7b645d1800/-473Wx593H-461088468-blue-MODEL.jpg',
    'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F42%2F73%2F4273adb72518d43696a1d8b8cf83d411a32f62d1.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_dresses_camidresses%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtTrlSpzJs5fw0Ztj79ol-KNHuKE80-L68HA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuPZRCLf6Y47Obx6R5RVDKTkwnRiGw1bVRMg&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 350,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 1.0
              ),
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: i,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator()
                          ),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
