import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card_list.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/widgets/header_title.dart';
import 'package:pokedex_mobile_app/widgets/text_input.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  BlocPokemon _blocPokemon;
  RefreshController _refreshController = RefreshController(initialRefresh: true);
  final _searchController = TextEditingController();
  List<Pokemon> _pokemonsList = List<Pokemon>();
  int _initialValue = 1;
  int _limitValue = 11;
  final int _incrementValue = 5;
  dynamic _exception;

  void _toggleSearchBox() async{  
    _pokemonsList.clear();
    _initialValue = 1;
    _limitValue = 11;
    await Future.delayed(Duration(milliseconds: 200));
    
    if(_searchController.text.isNotEmpty){      
      await _blocPokemon.getPokemonByNameOrId(_searchController.text)
      .then((pokemon) => _pokemonsList.add(pokemon))
      .catchError((error) { 
        print('detalle del error: $error');
        _exception = error;
      });
    }else{
      await _blocPokemon.getPokemons(_initialValue, _limitValue)
      .then((pokemons) => _pokemonsList.addAll(pokemons))
      .catchError((error) { 
        print('detalle del error: $error');
        _exception = error;
      });
    }
    _blocPokemon.loadedPokemonsSink.add(_pokemonsList);
    if(mounted)
      setState(() {
        
        if(_exception != null){
          _blocPokemon.loadedPokemonsSink.addError(_exception);
          _exception = null;
        }        
      });    
  }

  void _onLoadingPokemonList() async {
    await Future.delayed(Duration(milliseconds: 200));
    _initialValue = _limitValue;
    _limitValue = _limitValue + _incrementValue;    
    await _blocPokemon.getPokemons(_initialValue, _limitValue)
    .then((pokemons) { 
      _pokemonsList.addAll(pokemons);
      _refreshController.loadComplete();
    })
    .catchError((error) { 
      print('detalle del error: $error');
      _exception = error;
      _refreshController.loadFailed();
    }); 
    
    if (mounted)
      setState(() {
        _blocPokemon.loadedPokemonsSink.add(_pokemonsList);
        if(_exception != null){
          _blocPokemon.loadedPokemonsSink.addError(_exception);
          _exception = null;
        }  
      });
  }

  void _onRefreshPokemonList() async {
    // monitor network fetch
    
    await Future.delayed(Duration(milliseconds: 200));
    _searchController.clear();
    _initialValue = 1;
    _limitValue = 10; 
    _pokemonsList.clear(); 
    await _blocPokemon.getPokemons(_initialValue, _limitValue)
    .then((pokemons) { 
      _pokemonsList.addAll(pokemons);
      _refreshController.refreshCompleted();
    })
    .catchError((error) { 
      print('detalle del error: $error');
      _exception = error;
      _refreshController.refreshFailed();
    });    
    
    if (mounted)
      setState(() {
        _blocPokemon.loadedPokemonsSink.add(_pokemonsList);
        if(_exception != null){
          _blocPokemon.loadedPokemonsSink.addError(_exception);
          _exception = null;
        }  
      });
    
  }

  @override
  Widget build(BuildContext context) {

    _blocPokemon = BlocProvider.of<BlocPokemon>(context);
    var _openEndDrawer = Container(
                margin: EdgeInsets.only(top: 35, right: 20,),                
                child:SizedBox(
                  width: 35,
                  height: 35,
                  child:IconButton(
                    padding: EdgeInsets.only(bottom:2),
                    iconSize: 35,
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ) ,
              );
    return Stack(
        children: <Widget>[
          BackRed(height: 350),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[              
              HeaderTitle('Pokedex'),
              _openEndDrawer
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:300),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
          ),
          PokemonCardList(
              refreshController: _refreshController,
              onRefresh: _onRefreshPokemonList,
              onLoading: _onLoadingPokemonList,
              marginTop: 235,
            ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: TextInput(
              controller: _searchController,
              hitText: 'Find Pokemon...',
              inputType: TextInputType.text,
              onEditingComplete: () {
                _toggleSearchBox();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:200, left:20, right: 20),
            alignment: Alignment.topCenter,
            child: Text(
              'Pokemons',
              style: TextStyle(
                fontFamily:'FredokaOne',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          
        ],
      );

  }
}
