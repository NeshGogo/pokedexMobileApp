import 'package:flutter/material.dart';

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