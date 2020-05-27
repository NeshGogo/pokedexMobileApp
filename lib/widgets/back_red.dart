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
    final widthScreen = MediaQuery.of(context).size.width;
    
    return Container(
      height: height,
      width: widthScreen,
      color: Colors.red,
    );
  }
}
