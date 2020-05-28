import 'package:pokedex_mobile_app/User/model/user.dart';
import 'package:pokedex_mobile_app/User/repository/user_authentication_api.dart';

class UserAuthenticationRepository {
  final _userAuthenticationApi = UserAuthenticationAPI();

  Stream get authState => _userAuthenticationApi.authState;
  Future<User> get currentUser => _userAuthenticationApi.currentUser;
  Future<User> signInWithGoogle() => _userAuthenticationApi.signInWithGoogle();
  signOutWithGoogle() => _userAuthenticationApi.signOutWithGoogle();
}