import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';

import 'card_description.dart';
import 'circle_card_image.dart';

class PokemonCard extends StatelessWidget {
  
  final Pokemon pokemon;
  final double height;

  PokemonCard({
    Key key,
    @override this.pokemon,
    @override this.height,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      height: height,
      width: widthScreen-10,
      margin: EdgeInsets.only(right: 5, left: 5),
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