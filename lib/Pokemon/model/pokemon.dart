import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';

class Pokemon {
  final int id;
  final String name;
  final double height;
  final double weight;
  final String photoUrl;
  final List<PokemonAbility> abilities;
  final List<PokemonType> types;
  
  Pokemon({
    Key key,
    @required this.id,
    @required this.name,
    @required this.photoUrl,
    this.weight,
    this.height,
    this.abilities,
    this.types
  });
}