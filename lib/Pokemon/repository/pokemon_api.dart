import 'package:http/http.dart' as http;


class PokemonApi {
  final _apiUrl = 'pokemon/ditto/pokemon/';

  Future<http.Response> getPokemonByName(String pokemonName) async{
    return await http.get(_apiUrl+pokemonName);
  }

  Future<http.Response> getPokemonById(int pokemonId) async{
    return await http.get('$_apiUrl$pokemonId');
  }
}