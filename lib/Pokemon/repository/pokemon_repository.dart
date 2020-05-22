import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/repository/pokemon_api.dart';

class PokemonRepository {
  
  final PokemonApi _pokemonApi = PokemonApi();

  Future<Pokemon> getPokemonByNameOrId(String nameOrId) => _pokemonApi.getPokemonByNameOrId(nameOrId);
  Future<List<Pokemon>> getFirstOnehundrePokemons() => _pokemonApi.getFirstOnehundrePokemons();
}