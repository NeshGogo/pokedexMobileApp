import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/repository/pokemon_repository.dart';

class BlocPokemon implements Bloc {
  final PokemonRepository _pokemonRepository = PokemonRepository();

  Future<http.Response> getPokemonByName(String pokemonName) => _pokemonRepository.getPokemonByName(pokemonName);
  Future<http.Response> getPokemonById(int pokemonId) => _pokemonRepository.getPokemonById(pokemonId);
  Future<List<Pokemon>> getFirstOnehundrePokemons() => _pokemonRepository.getFirstOnehundrePokemons();
  
  @override
  void dispose() {
    // TODO: implement dispose
  }
}