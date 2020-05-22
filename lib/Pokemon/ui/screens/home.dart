import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card_list.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/widgets/text_input.dart';

class Home extends StatefulWidget {
  final String title;
  Home({
    Key key, 
    @required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }  
}

class _Home extends State<Home> {
  List<Pokemon> pokemonslist = [
    Pokemon(
      id: 132,
      name: "ditto",
      photoUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
      weight: 40,
      height: 3,
      types: <PokemonType>[ PokemonType(name: "Normal"), PokemonType(name: "Rock")]
    ),
    Pokemon(
      id: 132,
      name: "Pikachu",
      photoUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
      weight: 40,
      height: 3,
      types: <PokemonType>[ PokemonType(name: "Electric")]
    ),
    Pokemon(
      id: 132,
      name: "ditto",
      photoUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
      weight: 40,
      height: 3,
      types: <PokemonType>[ PokemonType(name: "normal")]
    ),
    Pokemon(
      id: 132,
      name: "ditto",
      photoUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
      weight: 40,
      height: 3,
      types: <PokemonType>[ PokemonType(name: "normal")]
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();

    return Stack(
      children: <Widget>[
        BackRed(title: widget.title, height: 350),
        PokemonCardList(pokemons: pokemonslist,),
        Container(
          margin: EdgeInsets.only(top:100),
          child: TextInput(
            controller: _searchController,
            hitText: 'Buscar pokemon...',
            inputType: TextInputType.text,
          ),
        ),
      
      ],
    );
  }
  
}