import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_ability.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon_type.dart';


class PokemonApi {
  final _apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<Pokemon> getPokemonByNameOrId(String nameOrId) async{
    var response = await http.get('$_apiUrl${nameOrId.toLowerCase()}');
    if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
      }      
    return buildPokemon(json.decode(response.body));
  }


  Future<List<Pokemon>> getPokemons(int initial, int limit) async{
    List<Pokemon> pokemons = List<Pokemon>();
    for (var pokemonId = initial; pokemonId < limit; pokemonId++) {      
      var response = await  http.get('$_apiUrl$pokemonId');
      if(response.statusCode != 200){
        throw Exception('Failed to load Pokemons');
      }      
      pokemons.add(buildPokemon(json.decode(response.body)));
    }
    return pokemons;
  }

  Pokemon buildPokemon(Map<String, dynamic> json) {   
    List<dynamic> pokemonAbilities= json['abilities'];
    
    List<dynamic> pokemonTypes= json['types'];

    //creating our Pokemon from API data.
    return Pokemon(
      id: json['id'],
      name: json['name'],
      weight: double.parse(json["weight"].toString()),
      height: double.parse(json['height'].toString()),
      photoUrl: json['sprites']['front_default'],
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
      }).toList()  
      
    );
  }
}