import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';

class PokemonTypesRow extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final MainAxisAlignment mainAxisAlignment;
  final List<PokemonType> pokemonTypes;

  PokemonTypesRow({
    Key key,
    @required this.pokemonTypes,
    @required this.mainAxisAlignment,
    @required this.margin
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(   
      mainAxisAlignment: mainAxisAlignment,   
      children: pokemonTypes.map((pokemontype) {       
        return Container(
            padding: EdgeInsets.all(5),
            margin: margin,
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              border: Border.all(
                color: Colors.blueGrey,
                width: 2, 
                style: BorderStyle.solid
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              pokemontype.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
                fontSize: 12
              ),
            ),
          );
      }).toList()
    );
  }
  
}