import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';
import 'package:pokedex_mobile_app/User/repository/user_cloud_firebase_api.dart';



class PokemonApi {
  final _apiUrl = 'https://pokeapi.co/api/v2/';
  final _userCloud = UserCloudFirebaseApi();

  Future<Pokemon> getPokemonByNameOrId(String nameOrId) async{
    var response = await http.get('${_apiUrl}pokemon/${nameOrId.toLowerCase()}');
    if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
      }      
    return buildPokemon(json.decode(response.body));
  }
  Future<List<String>> getPokemonEncounters(int id)async {
    var response = await http.get('${_apiUrl}pokemon/$id/encounters');
    if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
    }      
    List content = json.decode(response.body);
    
    if(content.length>0)
      return content.map((value) => value['location_area']['name'].toString()).toList();
    else
      return ["It doesn't have any place to encounter."];
    
  }
  
  Future<List<PokemonAbility>> getPokemonAbilityById(List<int> ids) async {
    List<PokemonAbility> abilities = List<PokemonAbility>();    
    
    for (var id in ids) {
      var response = await http.get('${_apiUrl}ability/$id');
      if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
      }
      abilities.add(buildAbility(json.decode(response.body)));
    }    
    return abilities;
  }

  Future<List<Pokemon>> getPokemons(int initial, int limit) async{
    List<Pokemon> pokemons = List<Pokemon>();
    for (var pokemonId = initial; pokemonId < limit; pokemonId++) {   
      pokemonId=pokemonId == 19? 20: pokemonId;//it is for a mistake with the API
      var response = await  http.get('${_apiUrl}pokemon/$pokemonId');
      if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
      }      
      pokemons.add(await buildPokemon(json.decode(response.body)));
    }
    return pokemons;
  }

  PokemonAbility buildAbility(Map<String, dynamic> json){
    return PokemonAbility(
      id: json['id'],
      name: json['name'],
      effect: json['effect_entries'][0]['effect']
    );
  }

  Future<Pokemon> buildPokemon(Map<String, dynamic> json) async{   
    var favortiePokemonIds = await _userCloud.getFavoritePokemons();
    List<dynamic> pokemonAbilities= json['abilities'];
    
    List<dynamic> pokemonTypes= json['types'];

    //creating our Pokemon from API data.
    return Pokemon(
      id: json['id'],
      name: json['name'],
      weight: double.parse(json["weight"].toString()),
      height: double.parse(json['height'].toString()),
      photoUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: pokemonTypes.map((elementMap) {
        String url = elementMap['type']['url'].toString();
        int endIndex = url.lastIndexOf('/');   
        const int startIndex = 31; // according to the URL of API.     
        return PokemonType(
          id: int.parse(url.substring(startIndex,endIndex)),// capture the index from URL.
          name: elementMap['type']['name'],
        );
      }).toList(),

      abilities: pokemonAbilities.map((elementMap) {
        String url = elementMap['ability']['url'].toString();
        int endIndex = url.lastIndexOf('/'); 
        const int startIndex = 34; // according to the URL of API.

        return PokemonAbility(
          id: int.parse(url.substring(startIndex,endIndex)),// capture the index from URL.
          name: elementMap['ability']['name'],
        );
      }).toList(),
      liked: (favortiePokemonIds.length > 0 && favortiePokemonIds.any((pokemonId) => pokemonId == json['id']) )? true : false, 
      
    );
  }
}