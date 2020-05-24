import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PokemonCardList extends StatelessWidget {
  BlocPokemon blocPokemon;
  List<Pokemon> pokemons;
  final RefreshController refreshController;
  final Function onRefresh;
  final Function onLoading;

  PokemonCardList({
    Key key,
    @required this.refreshController,
    @required this.onRefresh,
    @required this.onLoading,
  });

  Widget buildNotData() {
    return Container(
      margin: EdgeInsets.only(top: 159),
      child: SmartRefresher(
        enablePullUp: false,
        enablePullDown: true,
        header: WaterDropHeader(
          waterDropColor: Color.fromRGBO(150, 60, 60, 0.9),
        ),
        controller: refreshController,
        onRefresh: onRefresh,
        child: ListView(),
      ),
    );
  }

  Widget buildError(dynamic error) {
    return Container(
        margin: EdgeInsets.only(top: 180, left: 20),
        child: SmartRefresher(
          enablePullUp: false,
          enablePullDown: true,
          header: WaterDropHeader(
            waterDropColor: Color.fromRGBO(150, 60, 60, 0.9),
          ),
          controller: refreshController,
          onRefresh: onRefresh,
          child: Text(
            (error.message == "Failed to load Pokemons")?
            "No fue posible encontrar el Pokemon...":
            "Ocurrion un error al cargarlos datos, por favor vuelva a intentarlo...",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget builData(AsyncSnapshot snapshot) {

    if (snapshot.hasError) return buildError( snapshot.error);
    if (!snapshot.hasData) return buildNotData();    

    pokemons = snapshot.data;

    return Container(
      margin: EdgeInsets.only(top: 159),
      child: SmartRefresher(
        enablePullUp: true,
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
        controller: refreshController,
        child: ListView.builder(
          itemBuilder: (c, i) => PokemonCard(
            pokemon: snapshot.data[i],
            height: 170,
          ),
          //itemExtent: 100.0,
          itemCount: pokemons.length,
        ),
        onLoading: onLoading,
        onRefresh: onRefresh,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    blocPokemon = BlocProvider.of<BlocPokemon>(context);

    return StreamBuilder(
      stream: blocPokemon.loadedPokemonsStream,
      builder: (context, AsyncSnapshot snapshot) {
        return builData(snapshot);
      },
    );
  }
}

//before code

// ListView(
//         scrollDirection: Axis.vertical,
//         children: pokemons.map((pokemon) {
//           return PokemonCard(pokemon: pokemon, height: 170,);
//         }).toList()
