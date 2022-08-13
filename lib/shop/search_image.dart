import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Search_image extends StatefulWidget {
  @override
  _search_image createState() => _search_image();
}

class _search_image extends State<Search_image> {
  @override
  final List<Map<dynamic, dynamic>> products = [
    {
      'name': 'IPhone',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
    },
    {
      'name': 'IPhone X 2',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 12',
      'rating': 5.0,
      'image':
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final imagefile = ModalRoute.of(context)!.settings.arguments;
    File i=imagefile as File;

    print(imagefile);
    return Scaffold(
        appBar: AppBar(
          title: Text('search by image'),
        ),
        body: Column(children: [
         // if (imagefile != null)
          //  Container(
            //    child: imagefile == null
              //      ? Center(child: new Text('Sorry nothing selected!!'))
                //    : Center(child: new Image.file(imagefile)),),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
              children: List.generate(products.length, (index) {
                return Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card tappedyyy.');
                        Navigator.pushNamed(context, '/products',
                            arguments: index);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: (MediaQuery.of(context).size.width / 2 - 15),
                            width: double.infinity,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: products[index]['image'],
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                              title: Text(
                                'Two Gold Rings',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 1),
                                        child: Text('\$200',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text('(\$400)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SmoothStarRating(
                                          allowHalfRating: false,
                                          onRated: (v) {
                                            products[index]['rating'] = v;
                                            print(v);
                                            setState(() {});
                                          },
                                          starCount: 5,
                                          rating: products[index]['rating'],
                                          size: 16.0,
                                          color: Colors.amber,
                                          borderColor: Colors.amber,
                                          spacing: 0.0),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                            products[index]['rating']
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Theme.of(context)
                                                    .primaryColor)),
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
        ]));
  }

  // _pickFromGallery() async {
  //   PickedFile? image = await ImagePicker.platform
  //       .pickImage(source: ImageSource.gallery, imageQuality: 100);
  //   setState(() {
  //     imagefile = File(image!.path);
  //   });
  // }
}

//
// Image.file(
// _imagefile!,
// width: 300,
// height: 300,
// )

// _takeImageFromCamera() async {
//   PickedFile? image = await ImagePicker.platform
//       .pickImage(source: ImageSource.camera, imageQuality: 100);
//   setState(() {
//     _imagefile = File(image!.path);
//   });
// }
