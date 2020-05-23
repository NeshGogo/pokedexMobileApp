import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/repository/pokemon_repository.dart';

class BlocPokemon implements Bloc {
  final PokemonRepository _pokemonRepository = PokemonRepository();

  Future<Pokemon> getPokemonByNameOrId(String nameOrId) => _pokemonRepository.getPokemonByNameOrId(nameOrId);
  Future<List<Pokemon>> getFirstOnehundrePokemons() => _pokemonRepository.getFirstOnehundrePokemons();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}