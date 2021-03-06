import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card.dart';
import 'package:pokedex_mobile_app/User/bloc/bloc_user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PokemonCardList extends StatefulWidget {
  final RefreshController refreshController;
  final Function onRefresh;
  final Function onLoading;
  final double marginTop;
  

  PokemonCardList({
    Key key,
    @required this.refreshController,
    @required this.onRefresh,
    @required this.onLoading,
    @required this.marginTop,
  });


  @override
  State<StatefulWidget> createState() {

    return _PokemonCardList();
  }
}

class _PokemonCardList extends State<PokemonCardList>{
  BlocUser _blocUser;

  Widget buildNotData() {
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop),
      child: SmartRefresher(
        enablePullUp: false,
        enablePullDown: true,
        header: WaterDropHeader(
          waterDropColor: Color.fromRGBO(150, 60, 60, 0.9),
        ),
        controller: widget.refreshController,
        onRefresh: widget.onRefresh,
        child: ListView(),
      ),
    );
  }

  Widget buildError(dynamic error) {
    return Container(
        margin: EdgeInsets.only(top: 360, left: 20),
        child: SmartRefresher(
          enablePullUp: false,
          enablePullDown: true,
          header: WaterDropHeader(
            waterDropColor: Color.fromRGBO(150, 60, 60, 0.9),
          ),
          controller: widget.refreshController,
          onRefresh: widget.onRefresh,
          child: Text(
            (error.message == "Failed to load Pokemons")?
            "We can't find the pokemon, please try again...":
            "${error.message }, please try again...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ));
  }

  Widget builData(AsyncSnapshot snapshot) {

    if (snapshot.hasError) return buildError( snapshot.error);
    if (!snapshot.hasData) return buildNotData();    
    
    List<Pokemon> _pokemons = snapshot.data;
    int pokemonsLength = _pokemons.length;

    return Container(
      margin: EdgeInsets.only(top: widget.marginTop),
      child: SmartRefresher(
        enablePullUp: (pokemonsLength>1)? true : false,
        enablePullDown: true,
        header: WaterDropHeader(
          waterDropColor: Color.fromRGBO(150, 60, 60, 0.9),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            switch (mode) {
              case LoadStatus.idle:
                body = Text("Desliza para cargar");
                break;
              case LoadStatus.loading:
                body = CircularProgressIndicator(strokeWidth: 1);
                break;
              case LoadStatus.failed:
                body = Text("Carga fallida");
                break;
              case LoadStatus.canLoading:
                body = Text("Listo para cargar");
                break;
              default:
                body = Text("No hay mas datos");
                break;
            }
            return Container(
              height: 55.0, 
              alignment: Alignment.topCenter,
              child: body
            );
          },
        ),
        controller: widget.refreshController,
        child: (pokemonsLength > 1)?  
          ListView(
            scrollDirection: Axis.vertical,
            children: _pokemons.map((pokemon) {
              return PokemonCard(
                pokemon: pokemon, 
                height: 190,
                iconDataButtom: pokemon.liked? Icons.favorite: Icons.favorite_border,
                onPressedButtom: (){
                  _blocUser.currentUser.then((user) {
                    _blocUser.addOrRemoveFavoritePokemon(user.id, pokemon);
                  });
                  setState(() {
                    pokemon.liked = !pokemon.liked;
                  });
                },
              );
            }).toList(),
          ):
          PokemonCard(
            pokemon: _pokemons[0],
            height: 190,
            iconDataButtom: _pokemons[0].liked? Icons.favorite: Icons.favorite_border,
            onPressedButtom: (){
              _blocUser.currentUser.then((user) {
                _blocUser.addOrRemoveFavoritePokemon(user.id, _pokemons[0]);
              });
              setState(() {
                _pokemons[0].liked = !_pokemons[0].liked;
              });
            }
          ),
        onLoading: widget.onLoading,
        onRefresh: widget.onRefresh,
      ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    final BlocPokemon _blocPokemon = BlocProvider.of<BlocPokemon>(context);
    _blocUser = BlocProvider.of<BlocUser>(context);
    return StreamBuilder(
      stream: _blocPokemon.loadedPokemonsStream,
      builder: (context, AsyncSnapshot snapshot) {
        return builData(snapshot);
      },
    );
  }
}

