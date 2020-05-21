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
      width: widthScreen-40,
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 40),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(145, 214, 255, 0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 20),
            blurRadius: 15, 
          )
        ]
      ),
      child: Column(
        children: <Widget>[
            Container(   
              margin: EdgeInsets.only(bottom:15),       
              child: Text(
                pokemon.name.toUpperCase(),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleCardImage(
                  imagePath: pokemon.photoUrl, 
                  height: 80, 
                  width: 80,
                ),
              CardDescription(
                name: pokemon.name, 
                pokemonTypes: pokemon.types,
                weight: pokemon.weight, 
                height: pokemon.height,
              )
              ],
            ),
        ],
      )
    );
  }
  
}