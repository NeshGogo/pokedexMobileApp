import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';
import 'pokemon_types_row.dart';

class CardDescription extends StatelessWidget {
  final String name;
  final List<PokemonType> pokemonTypes;
  final double weight;
  final double height;
  final double width;

  CardDescription({
    Key key,
    @override this.name,
    @override this.pokemonTypes,
    @override this.weight,
    @override this.height,
    @override this.width
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
                '$height',
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
                '$weight',
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
    
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width,
          child:_dimensionsRow(),
        ),
        Container(
          width: width,
          child:PokemonTypesRow(
            pokemonTypes: pokemonTypes,
            margin: EdgeInsets.only(right:10, top: 20 ),
            mainAxisAlignment: MainAxisAlignment.start
          ),
        )
        
      ],
    );
  }
  
}