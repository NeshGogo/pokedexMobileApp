import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
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
  BlocPokemon blocPokemon;
  final _searchController = TextEditingController();

  Widget buildData(AsyncSnapshot<List<Pokemon>> pokemonList){
      if(pokemonList.hasError || !pokemonList.hasData){
        return Container();
      }

      return Stack(
          children: <Widget>[
            BackRed(title: widget.title, height: 350),
            PokemonCardList(pokemons: pokemonList.data,),
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

  @override
  Widget build(BuildContext context) {
    blocPokemon = BlocProvider.of<BlocPokemon>(context); 
    return FutureBuilder(
      future: blocPokemon.getFirstOnehundrePokemons(),
      builder: (context, AsyncSnapshot<List<Pokemon>> snapshot){        
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
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