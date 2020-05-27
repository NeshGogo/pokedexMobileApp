import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_detail_body.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_detail_header.dart';
import 'package:pokedex_mobile_app/widgets/header_title.dart';

class PokemonDetailScreen extends StatelessWidget {
  BlocPokemon _blocPokemon;
  final Pokemon pokemon;
  PokemonDetailScreen({@required this.pokemon});

  Widget buildBody() {
    return FutureBuilder(
      future: _blocPokemon
          .getPokemonAbilityById(pokemon.abilities.map((e) => e.id).toList()),
      builder:
          (context, AsyncSnapshot<List<PokemonAbility>> snapshotAbilities) {
        if (snapshotAbilities.hasError || !snapshotAbilities.hasData) {
          return Container();
        }
        return FutureBuilder(
          future: _blocPokemon.getPokemonEncounters(pokemon.id),
          builder: (context, AsyncSnapshot<List<String>> snapshotEncounters) {
            if (snapshotEncounters.hasError || !snapshotEncounters.hasData) {
              return Container();
            }
            Future.delayed(Duration(milliseconds: 200));
            return PokemonDetailBody(
              abilities: snapshotAbilities.data,
              encountersPlace: snapshotEncounters.data,
            );
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _blocPokemon = BlocProvider.of<BlocPokemon>(context);
    final _goBack = Container(
      padding: EdgeInsets.only(top: 25, left: 5),
      child: SizedBox(
        width: 45,
        height: 45,
        child: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 45,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                BackRed(height: 360),
                Row(
                  children:[
                    _goBack,
                    HeaderTitle( 'Pokemon Detail')
                  ]
                ),
                PokemonDetailHeader(
                  pokemon: pokemon,
                ),
                buildBody()
              ]
            ),
          )
        ]
      )
    );
  }
}
