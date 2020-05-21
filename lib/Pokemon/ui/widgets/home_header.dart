import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        BackRed(title: 'Pokedex', height: 350),
      ],
    );
  }
  
}