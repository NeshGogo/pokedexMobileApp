import 'package:flutter/material.dart';

class PokemonAbility {
  final int id;
  final String name;
  final String effect;

  PokemonAbility({
    Key key,
    @required this.name,
    this.id,
    this.effect,
  });
}