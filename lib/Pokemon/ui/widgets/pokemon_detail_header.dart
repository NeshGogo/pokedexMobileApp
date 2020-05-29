import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'pokemon_types_row.dart';
import 'package:pokedex_mobile_app/widgets/full_screen_image.dart';

class PokemonDetailHeader extends StatelessWidget {

  final Pokemon pokemon;

  PokemonDetailHeader({
    Key key,
    @required this.pokemon
  });
  
  Widget _circleImage (BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 80),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container( 
            height: 100,
            width:100,
            decoration: BoxDecoration(                
              shape: BoxShape.circle,
              color: Colors.white
            ),
            child: Material(              
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                radius: 35,
                splashColor: Colors.redAccent,
                onTap: ()=> Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>FullScreenImage(pokemon.photoUrl)
                )),
                child: Hero(
                  tag: 'imageHero',
                  child: Image.network(pokemon.photoUrl),
                ),
                
              ),
            )
          ),
          Container(
            margin:EdgeInsets.only(top:5),
            child: Text(
              pokemon.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )
    );
  }
  Widget _characteristics(){
    final height = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom:5),
          child: Text(
            'Height:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:Colors.white 
            )
          )
        ),
        Container(
          margin: EdgeInsets.only(bottom:5),
          child: Text(
            pokemon.height.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color:Colors.amber 
            )
          )
        )
      ],
    );
    final weight = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom:5),
          child: Text(
            'Weight:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:Colors.white 
            )
          )
        ),
        Container(
          margin: EdgeInsets.only(bottom:5),
          child: Text(
            pokemon.weight.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color:Colors.amber 
            )
          )
        )
      ],
    );

    return Container(
      margin: EdgeInsets.only(top:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          height,
          weight
        ],
      ),
    );
  }

  Widget _pokemonTypes(double width){
    return Container(
      margin: EdgeInsets.only(top:10),
      alignment: Alignment.center,
      child: Column(
        children:<Widget>[
          Container(
            margin: EdgeInsets.only(bottom:5),
            child: Text(
              'Types:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:Colors.white 
              )
            )
          ),
          Container(
            width: width,
            alignment: Alignment.center,
            child: PokemonTypesRow(
              pokemonTypes: pokemon.types,
              margin: EdgeInsets.only(top:8),
              spacingBetween: 5,
            ),
          )
          
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          _circleImage(context),
          _characteristics(),
          _pokemonTypes(width/2)
        ],
      ),
    );
  }
  
}