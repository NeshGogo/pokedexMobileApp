
import 'package:flutter/material.dart';

class PokemonType {
  final int id;
  final String name;

  PokemonType({
    Key key, 
    @required this.name, 
    this.id
  });
}