import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/repository/pokemon_api.dart';

class PokemonRepository {
  
  final PokemonApi _pokemonApi = PokemonApi();

  Future<http.Response> getPokemonByName(String pokemonName) => _pokemonApi.getPokemonByName(pokemonName);
  Future<http.Response> getPokemonById(int pokemonId) => _pokemonApi.getPokemonById(pokemonId);
  Future<List<Pokemon>> getFirstOnehundrePokemons() => _pokemonApi.getFirstOnehundrePokemons();
}