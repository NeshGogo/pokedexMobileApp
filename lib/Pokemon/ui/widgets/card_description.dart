import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';

class CardDescription extends StatelessWidget {
  final String name;
  final List<PokemonType> pokemonTypes;
  final double weight;
  final double height;

  CardDescription({
    Key key,
    @override this.name,
    @override this.pokemonTypes,
    @override this.weight,
    @override this.height
  });

  Widget _dimensionsRow(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            'Height: $height',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(          
          child: Text(
            'Weight: $weight',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],

    );
  }
  Widget _pokemonTypeRow(){
    List<Widget> _pokemonTypeBoxes;
    
    pokemonTypes.forEach((pokemontype) { 
      _pokemonTypeBoxes.add(
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right:10),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(
              color: Colors.lightBlue,
              width: 0.1, 
              style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Text(
            pokemontype.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
              fontSize: 17
            ),
          ),
        )

      );
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _pokemonTypeBoxes
    );
  }
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: <Widget>[
        _dimensionsRow(),
        _pokemonTypeRow()
      ],
    );
  }
  
}