import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';


class PokemonApi {
  final _apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<http.Response> getPokemonByName(String pokemonName) async{
    return await http.get(_apiUrl+pokemonName);
  }

  Future<http.Response> getPokemonById(int pokemonId) async{
    return await http.get('$_apiUrl$pokemonId');
  }

  Pokemon buildPokemon(AsyncSnapshot snapshot){
    return Pokemon();
  }
}