import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_detail_header.dart';

class PokemonDetailScreen extends StatelessWidget {
  
  Pokemon pokemon = new Pokemon(
    name: 'Pikachu', 
    photoUrl:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png" ,
    height: 20,
    weight: 20,
    types: [PokemonType(name: 'electric'), PokemonType(name: 'rock')]
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        BackRed(title: 'Pokemon Detail', height: 350),
        PokemonDetailHeader(pokemon: pokemon,)
      ]
    );
  }
  
}