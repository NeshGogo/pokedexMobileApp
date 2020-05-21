import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';

import 'card_description.dart';
import 'circle_card_image.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({
    Key key,
    @override this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleCardImage(
          imagePath: pokemon.photoUrl, 
          height: 100, 
          width: 100,
        ),
        CardDescription(
          name: pokemon.name, 
          pokemonTypes: pokemon.types,
          weight: pokemon.weight, 
          height: pokemon.height,
        )
        ],
      ),
    );
  }
  
}