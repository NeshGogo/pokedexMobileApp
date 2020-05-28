import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/screens/pokemon_details_screen.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_detail_body.dart';

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
  Widget buildCard(double widthScreen){
    return Container(
      height: height,
      width: widthScreen-40,
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 40),
      decoration: BoxDecoration(
        color: Color.fromRGBO(150, 60, 60, 0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 20),
            blurRadius: 15, 
          )
        ],
        
      ),
      child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleCardImage(
                  imagePath: pokemon.photoUrl, 
                  height: height, 
                  width: 150,
                ),
                Column(      
                  crossAxisAlignment: CrossAxisAlignment.start,           
                  children: <Widget>[                      
                  Container(   
                    margin: EdgeInsets.only(top:10,bottom:15),
                    width: widthScreen-210,       
                    child: Text(
                      pokemon.name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  CardDescription(
                    name: pokemon.name, 
                    pokemonTypes: pokemon.types,
                    weight: pokemon.weight, 
                    height: pokemon.height,
                    width: widthScreen-210,
                  )
                ],
              )
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    // TODO: implement build
    return InkWell(
      splashColor: Colors.redAccent,
      onTap: () async{
        await Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => PokemonDetailScreen(pokemon: pokemon,))
        );
      },
      child: buildCard(widthScreen),
    );
  }
  
}