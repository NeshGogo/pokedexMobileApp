import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card_list.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/widgets/text_input.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pokedex_mobile_app/utils/listview_state_enum.dart';

class Home extends StatefulWidget {
  final String title;
  Home({
    Key key,
    @required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  BlocPokemon blocPokemon;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  final _searchController = TextEditingController();
  List<Pokemon> _pokemonsList = List<Pokemon>();
  int _initialValue = 1;
  int _limitValue = 11;
  final int _incrementValue = 10;
  var _listviewState = ListviewStateEnum.initial;

  void _toggleSearchBox() {
    setState(() {
      _searchController.text = _searchController.text;
      _initialValue = 1;
      _limitValue = 11;
      _listviewState = _searchController.text.isEmpty
          ? ListviewStateEnum.initial
          : ListviewStateEnum.search;
    });
  }

  void _onLoadingPokemonList() async {
    await Future.delayed(Duration(milliseconds: 1000));

    if (mounted)
      setState(() {
        _initialValue = _limitValue;
        _limitValue = _limitValue + _incrementValue;
        _listviewState = ListviewStateEnum.load;
      });
      _refreshController.loadComplete();
  }

  void _onRefreshPokemonList() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      _initialValue = 1;
      _limitValue = 10;
      _listviewState = ListviewStateEnum.refresh;
    });
  }

  Widget loadingInterface() {
    return Stack(
      children: <Widget>[
        BackRed(title: widget.title, height: 350),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: TextInput(
            controller: _searchController,
            hitText: 'Buscar pokemon...',
            inputType: TextInputType.text,
            onEditingComplete: () {
              _toggleSearchBox();
            },
          ),
        ),
        Center(child: CircularProgressIndicator()),
      ],
    );
  }

  Widget showErrorInfo() {
    return Stack(
      children: <Widget>[
        BackRed(title: widget.title, height: 350),
        Container(
          margin: EdgeInsets.only(top: 180, left: 20),
          child: Text(
            "No fue posible encontrar el Pokemon o algun error ocurrio...",
            style: TextStyle(
              fontSize: 37,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: TextInput(
            controller: _searchController,
            hitText: 'Buscar pokemon...',
            inputType: TextInputType.text,
            onEditingComplete: () {
              _toggleSearchBox();
            },
          ),
        ),
      ],
    );
  }

  Widget buildData(AsyncSnapshot snapshot) {
    if (snapshot.hasError || !snapshot.hasData) return showErrorInfo();

    switch (_listviewState) {
      case ListviewStateEnum.initial:
        _pokemonsList.clear();
        _pokemonsList.addAll(snapshot.data);
        break;
      case ListviewStateEnum.load:
        _pokemonsList.addAll(snapshot.data);
        break;
      case ListviewStateEnum.search:
        _pokemonsList.clear();
        _pokemonsList.add(snapshot.data);
        break;
      case ListviewStateEnum.refresh:
        _pokemonsList.clear();
        _pokemonsList.addAll(snapshot.data);
        break;
    }
    return Stack(
      children: <Widget>[
        BackRed(title: widget.title, height: 350),
        PokemonCardList(
            pokemons: _pokemonsList,
            refreshController: _refreshController,
            onRefresh: _onRefreshPokemonList,
            onLoading: _onLoadingPokemonList),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: TextInput(
            controller: _searchController,
            hitText: 'Buscar pokemon...',
            inputType: TextInputType.text,
            onEditingComplete: () {
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
        future: _searchController.text.isEmpty
            ? blocPokemon.getPokemons(_initialValue, _limitValue)
            : blocPokemon.getPokemonByNameOrId(_searchController.text),
        builder: (context, AsyncSnapshot snapshot) {
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
        });
  }
}
