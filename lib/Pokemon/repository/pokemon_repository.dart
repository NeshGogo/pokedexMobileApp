
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';
import 'package:pokedex_mobile_app/Pokemon/repository/pokemon_api.dart';

class PokemonRepository {
  
  final PokemonApi _pokemonApi = PokemonApi();

  Future<Pokemon> getPokemonByNameOrId(String nameOrId) => _pokemonApi.getPokemonByNameOrId(nameOrId);
  Future<List<Pokemon>> getPokemons(int initial, int limit) => _pokemonApi.getPokemons(initial, limit);
  Future<List<PokemonAbility>> getPokemonAbilityById(List<int> ids) => _pokemonApi.getPokemonAbilityById(ids);
  Future<List<String>> getPokemonEncounters(int id) => _pokemonApi.getPokemonEncounters(id);
}