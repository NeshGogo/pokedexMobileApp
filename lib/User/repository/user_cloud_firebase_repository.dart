import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';

import 'user_cloud_firebase_api.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';

class UserCloudFirebaseRepository{
  final _cloudFirebaseApi = UserCloudFirebaseApi();

  void updateOrSetUser(User user) => _cloudFirebaseApi.updateOrSetUser(user);
  void addOrRemoveFavoritePokemon(String userId, Pokemon pokemon) =>  _cloudFirebaseApi.addOrRemoveFavoritePokemon(userId, pokemon);
  Future<List<int>> getFavoritePokemons() => _cloudFirebaseApi.getFavoritePokemons();
}