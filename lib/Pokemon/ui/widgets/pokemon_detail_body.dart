import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';

class PokemonDetailBody extends StatelessWidget {
  final List<PokemonAbility> abilities;
  final List<String> encountersPlace;
  double _widthScream;
  PokemonDetailBody({
    Key key,
    @required this.abilities,
    this.encountersPlace
  });

  Widget _encounterPlaces(){
    return Container(
      child:Column(
        children: this.encountersPlace.map((place) { 
          return Card(
            margin: EdgeInsets.only(left:10, right:10, bottom: 10),
            elevation: 1,
            child: Container(
              margin: EdgeInsets.only(top:10, bottom:10, left: 10, right:10),
              width: _widthScream-20,
              child: Text(
                place,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blueGrey
                )
              ),
            )
          );
        }).toList(),      
      )
    );
  }
  Widget _abilitiesCountainer(){
    return Container(
      child: Column(
        children: this.abilities.map((ability) {
          return Card(
            margin: EdgeInsets.only(left:10, right:10, bottom: 10),
            elevation: 1,            
            child: Container(
              margin: EdgeInsets.only(top:10, bottom:10, left: 10, right:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(                        
                        child: Text(
                          'Name: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                        
                        child: Text(
                          ability.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blueGrey
                          )
                        ),
                        )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(                        
                          child: Text(
                            'Effect: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: _widthScream - 92,
                          child: Text(
                            ability.effect?? '',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blueGrey          
                            )
                          ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            )
          );
        }).toList()
      ),
    );
  }

  Widget _seccionHeade(String title){
    return Container(
      margin: EdgeInsets.only(bottom:10, top: 10),
      child:Text(
        title,
        style: TextStyle(
          fontFamily: 'FredokaOne',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.red
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _widthScream = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top:350),
      child:Column(
        children: <Widget>[
          _seccionHeade('Abilities'),
          _abilitiesCountainer(),
          _seccionHeade('Encounter Places'),
          _encounterPlaces()
        ],
      ),
    );
  }
  
}