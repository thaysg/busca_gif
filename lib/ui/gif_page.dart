import 'package:busca_gif/services/gif_service.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class GifPage extends StatelessWidget {


  final Map gifData;

  const GifPage({Key key, this.gifData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var gifService = GifService();

    return Scaffold(
      appBar: AppBar(
        title: Text(gifData['title']),
        backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context, false),
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              /*Share.share(_gifData["images"]["fixed_height"]["url"]);*/
              gifService.onImageShared(gifData);
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SwipeDetector(
          swipeConfiguration: SwipeConfiguration(
              verticalSwipeMinVelocity: 100.0,
              verticalSwipeMinDisplacement: 50.0,
              verticalSwipeMaxWidthThreshold: 100.0,
              horizontalSwipeMaxHeightThreshold: 50.0,
              horizontalSwipeMinDisplacement: 50.0,
              horizontalSwipeMinVelocity: 200.0),
          child: Hero(
            key: key,
            tag: gifData['title'],
            child: Image.network(gifData['images']['fixed_height']['url']),
          ),
          onSwipeDown: () {
            Navigator.pop(context, false);
          },
        ),
      ),
    );
  }
}
