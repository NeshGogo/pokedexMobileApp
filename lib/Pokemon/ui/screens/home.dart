import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
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
  BlocPokemon blocPokemon;
  final _searchController = TextEditingController();

  void _toggleSearchBox(){
    setState(() {
      _searchController.text = _searchController.text;
    });
  }
  Widget loadingInterface(){
    return Stack(
          children: <Widget>[
            BackRed(title: widget.title, height: 350),
            Container(
              margin: EdgeInsets.only(top:100),
              child: TextInput(
                controller: _searchController,
                hitText: 'Buscar pokemon...',
                inputType: TextInputType.text,
                onEditingComplete: (){
                  _toggleSearchBox();
                },
              ),
            ),
            Center(child:CircularProgressIndicator()),
          ],
        );
  }

  Widget buildData(AsyncSnapshot snapshot){
      List<Pokemon> pokemons = List<Pokemon>();

      if(snapshot.hasError || !snapshot.hasData){
        return Stack(
          children: <Widget>[
            BackRed(title: widget.title, height: 350),
            Container(
              margin: EdgeInsets.only(top:180, left: 20),
              child: Text(
                  "We can't find the pokemon or a error occurred...",
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  
                    
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.only(top:100),
              child: TextInput(
                controller: _searchController,
                hitText: 'Buscar pokemon...',
                inputType: TextInputType.text,
                onEditingComplete: (){
                  _toggleSearchBox();
                },
              ),
            ),
          ],
        );
      }

      (snapshot.data is List<Pokemon>)? pokemons.addAll(snapshot.data): pokemons.add(snapshot.data);

      return Stack(
          children: <Widget>[
            BackRed(title: widget.title, height: 350),
            PokemonCardList( pokemons:pokemons ),
            Container(
              margin: EdgeInsets.only(top:100),
              child: TextInput(
                controller: _searchController,
                hitText: 'Buscar pokemon...',
                inputType: TextInputType.text,
                onEditingComplete: (){
                  _toggleSearchBox();
                },
              ),
            ),
          
          ],
        );
    }

  @override
  Widget build(BuildContext context) {
    blocPokemon = BlocProvider.of<BlocPokemon>(context); 
    return FutureBuilder(
      future:_searchController.text.isEmpty? 
        blocPokemon.getFirstOnehundrePokemons() : 
        blocPokemon.getPokemonByNameOrId(_searchController.text),
      builder: (context, AsyncSnapshot snapshot){        
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingInterface();   
          case ConnectionState.none:
            return loadingInterface();
          case ConnectionState.active:
            return buildData(snapshot);
          case ConnectionState.done: 
            return buildData(snapshot);   
          default:
            return buildData(snapshot);
        }
      }
    );
  }
  
}