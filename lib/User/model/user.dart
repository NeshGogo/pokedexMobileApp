import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final List<int> favoritePokemons;

  User({
    Key key,
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.photoUrl,
    this.favoritePokemons
  });
}