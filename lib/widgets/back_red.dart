import 'package:flutter/material.dart';

class BackRed extends StatelessWidget {
  final double height;
  final String title;

  BackRed({
    Key key,
    @required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen =MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      height: height,
      width: widthScreen,
      padding: EdgeInsets.only(top:30, left:20, right: 20),
      color: Colors.red,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
      ),
    );
  }
  
}