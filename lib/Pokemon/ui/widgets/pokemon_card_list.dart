import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card.dart';

class PokemonCardList extends StatelessWidget {
  List<Pokemon> pokemons;

  PokemonCardList({
    Key key,
    @required this.pokemons
  });

  @override
  Widget build(BuildContext context) {    
    return ListView(
      scrollDirection: Axis.vertical,
      children: pokemons.map((pokemon) {
        return PokemonCard(pokemon: pokemon, height: 250,);
      }).toList()
    );
  }
  
}