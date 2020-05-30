import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';
import 'package:pokedex_mobile_app/User/repository/user_authentication_repository.dart';
import 'package:pokedex_mobile_app/User/repository/user_cloud_firebase_repository.dart';

class BlocUser implements Bloc{
  
  final _userAuthenticationRepository = UserAuthenticationRepository();
  final _userCloudFirebaseRepository = UserCloudFirebaseRepository();
  Stream get authState => _userAuthenticationRepository.authState;
  Future<User> get currentUser => _userAuthenticationRepository.currentUser;
  Future<User> signInWithGoogle() => _userAuthenticationRepository.signInWithGoogle();
  signOutWithGoogle() => _userAuthenticationRepository.signOutWithGoogle();
  void updateOrSetUser(User user) => _userCloudFirebaseRepository.updateOrSetUser(user);
  void addOrRemoveFavoritePokemon(String userId, Pokemon pokemon) =>  
    _userCloudFirebaseRepository.addOrRemoveFavoritePokemon(userId, pokemon);
  Future<List<int>> getFavoritePokemons() => _userCloudFirebaseRepository.getFavoritePokemons();

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}