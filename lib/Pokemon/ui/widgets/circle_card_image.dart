import 'package:flutter/material.dart';

class CircleCardImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  double radius;

  CircleCardImage({
    Key key,
    @required this.imagePath,
    @required this.height,
    @required this.width,
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 50),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 211, 140, 0.7),
        image: DecorationImage(
          image:NetworkImage(imagePath), 
          fit: BoxFit.cover
        ),
        shape: BoxShape.circle
      ),
    );
  }
  
}