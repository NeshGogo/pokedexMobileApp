import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  FullScreenImage(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Hero(
          tag: 'imageHero',
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill
              ),
            )
          )
        ),
        )
    );
  }
  
  
}