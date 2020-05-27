import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';
import 'package:pokedex_mobile_app/Pokemon/repository/pokemon_repository.dart';

class BlocPokemon implements Bloc {
  final PokemonRepository _pokemonRepository = PokemonRepository();

  Future<Pokemon> getPokemonByNameOrId(String nameOrId) => _pokemonRepository.getPokemonByNameOrId(nameOrId);
  Future<List<Pokemon>> getPokemons(int initial, int limit) => _pokemonRepository.getPokemons(initial, limit);
  Future<List<PokemonAbility>> getPokemonAbilityById(List<int> ids) => _pokemonRepository.getPokemonAbilityById(ids);
  Future<List<String>> getPokemonEncounters(int id) => _pokemonRepository.getPokemonEncounters(id);

  StreamController loadedPokemonsController = StreamController();
  Stream  get loadedPokemonsStream => loadedPokemonsController.stream; 
  StreamSink get loadedPokemonsSink => loadedPokemonsController.sink;
  
  @override
  void dispose() {
    // TODO: implement dispose
  }
}