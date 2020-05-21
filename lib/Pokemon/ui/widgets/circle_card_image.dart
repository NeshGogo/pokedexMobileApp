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
    this.radius = 20
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:NetworkImage(imagePath), 
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(radius),
        shape: BoxShape.circle
      ),
    );
  }
  
}