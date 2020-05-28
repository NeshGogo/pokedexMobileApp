import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  HeaderTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'FredokaOne'),
      ),
    );
  }
  
}