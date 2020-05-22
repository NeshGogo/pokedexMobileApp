import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';


class PokemonApi {
  final _apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<http.Response> getPokemonByName(String pokemonName) async{
    return await http.get(_apiUrl+pokemonName);
  }

  Future<http.Response> getPokemonById(int pokemonId) async{
    return await http.get('$_apiUrl$pokemonId');
  }
  Future<List<Pokemon>> getFirstOnehundrePokemons() async{
    List<Pokemon> pokemons = List<Pokemon>();
    for (var pokemonId = 1; pokemonId <= 100; pokemonId++) {      
      var response = await  http.get('$_apiUrl$pokemonId');
      if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
      }      
      pokemons.add(buildPokemon(json.decode(response.body)));
    }
    return pokemons;
  }
  Pokemon buildPokemon(Map<String, dynamic> json) {   
    const int startIndex = 31; // according to the URL of API.
    //creating our Pokemon from API data.
    return Pokemon(
      id: json['id'],
      name: json['name'],
      weight: double.parse(json["weight"].toString()),
      height: double.parse(json['height'].toString()),
      photoUrl: json['name']['front_default'],
      types: json['types'].map((elementMap) {
        String url = elementMap['type']['url'].toString();
        int endIndex = url.lastIndexOf('/');        
        return PokemonType(
          id: int.parse(url.substring(startIndex,endIndex)),// capture the index from URL.
          name: elementMap['type']['name'],
        );
      }).toList(),
      abilities: json['abilities'].map((elementMap) {
        String url = elementMap['ability']['url'].toString();
        int endIndex = url.lastIndexOf('/');        
        return PokemonType(
          id: int.parse(url.substring(startIndex,endIndex)),// capture the index from URL.
          name: elementMap['ability']['name'],
        );
      }).toList()  

    );
  }
}