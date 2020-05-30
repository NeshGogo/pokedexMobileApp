import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_card_list.dart';
import 'package:pokedex_mobile_app/User/bloc/bloc_user.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/widgets/header_title.dart';

class MyFavoritePokemonsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFavoritePokemonsScreen();
  }
}

class _MyFavoritePokemonsScreen extends State<MyFavoritePokemonsScreen> {
  BlocUser _blocUser;
  BlocPokemon _blocPokemon;

  Widget _myFavoriteCardList(BuildContext context) {
    return FutureBuilder(
        future: _blocUser.getFavoritePokemons(),
        builder: (context, AsyncSnapshot<List<int>> favPokemonSnapshot) {
          if (favPokemonSnapshot.hasError || !favPokemonSnapshot.hasData)
            return Container();

          return ListView(
              padding: EdgeInsets.zero,
              children: favPokemonSnapshot.data.map((pokemonId) {
                return FutureBuilder(
                    future: _blocPokemon.getPokemonByNameOrId(pokemonId.toString()),
                    builder: (context, AsyncSnapshot<Pokemon> pokemonSnapshot) {
                      
                      if (pokemonSnapshot.hasError || !pokemonSnapshot.hasData)
                        return Container();
                      
                      return PokemonCard(
                        pokemon: pokemonSnapshot.data,
                        height: 190,
                        iconDataButtom: pokemonSnapshot.data.liked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        onPressedButtom: () {
                          _blocUser.currentUser.then((user) {
                            _blocUser.addOrRemoveFavoritePokemon(
                                user.id, pokemonSnapshot.data);
                          });
                          setState(() {
                            pokemonSnapshot.data.liked =
                                !pokemonSnapshot.data.liked;
                          });
                        },
                      );
                    });
              }).toList());
        });
  }

  @override
  Widget build(BuildContext context) {
    _blocPokemon = BlocProvider.of<BlocPokemon>(context);
    _blocUser = BlocProvider.of<BlocUser>(context);
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
      body: Stack(
        children: <Widget>[
          BackRed(height: 350),
          Wrap(direction: Axis.vertical, runSpacing: -20, children: [
            _goBack,
            HeaderTitle('Favorite Pokemons'),
          ]),
          Container(
            margin: EdgeInsets.only(top: 300),
            decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          Container(
            margin: EdgeInsets.only(top: 160),
            child: _myFavoriteCardList(context),
          ),
        ],
      ),
    );
  }
}
