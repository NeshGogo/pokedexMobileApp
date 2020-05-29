import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';
import 'pokemon_types_row.dart';

class CardDescription extends StatelessWidget {
  final double height;
  final List<PokemonType> pokemonTypes;
  final double pokemonWeight;
  final double pokemonHeight;
  final double width;

  CardDescription({
    Key key,
    @override this.pokemonTypes,
    @override this.pokemonWeight,
    @override this.pokemonHeight,
    @override this.width,
    @override this.height
  });

  Widget _dimensionsRow(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(    
              margin: EdgeInsets.only(bottom:5), 
              child: Text(
                'Height: ',
                style: TextStyle(
                  color: Color.fromRGBO(206, 204, 204, 8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(     
              child: Text(
                '$pokemonHeight',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
        Row(
          children:[
            Container(                
              child: Text(
                'Weight: ',
                style: TextStyle(
                  color: Color.fromRGBO(206, 204, 204, 8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(          
              child: Text(
                '$pokemonWeight',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ]
        )
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: height,
      width: width,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            child:_dimensionsRow(),
          ),
          Container(
            height: height-38,
            alignment: Alignment.bottomCenter,
            child:PokemonTypesRow(
              pokemonTypes: pokemonTypes,
              margin: EdgeInsets.only(right:10, top: 10 ),
              spacingBetween: 0,
              runSpacing: -5,
            ),
          )
          
        ],
      ),
    );
  }
  
}