import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';

class BackRed extends StatelessWidget {
  final double height;

  BackRed({
    Key key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final _widthScreen = MediaQuery.of(context).size.width;
    final _screamHeight = MediaQuery.of(context).size.height;
    return Container(
      height: height?? _screamHeight,
      width: _widthScreen,
      color: Colors.red,
      child: FittedBox(
        fit: BoxFit.none,        
        child: Row(
          children:[
            Container(
              alignment: Alignment(1.8,0),
              height: _screamHeight,
              width: _screamHeight,
              margin: EdgeInsets.only(right: _widthScreen/2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_screamHeight/2),
                color: Colors.redAccent
              ),
            ),
            Container(
              alignment: Alignment(1.8,0),
              height: _screamHeight,
              width: _screamHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_screamHeight/2),
                color: Colors.redAccent
              ),
            ),
          ]
        )
        
      ),
    );
  }
}
