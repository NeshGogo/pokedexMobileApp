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
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(     
              child: Text(
                '$height',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 17,
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
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(          
              child: Text(
                '$weight',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ]
        )
      ],

    );
  }
  Widget _pokemonTypeRow(){
    
    return Row(      
      children: pokemonTypes.map((pokemontype) {       
        return Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right:10, top: 20 ),
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
                fontSize: 17
              ),
            ),
          );
      }).toList()
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _dimensionsRow(),
        _pokemonTypeRow()
      ],
    );
  }
  
}