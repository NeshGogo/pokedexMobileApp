import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';
import 'package:pokedex_mobile_app/User/repository/user_authentication_repository.dart';

class BlocUser implements Bloc{
  final _userAuthenticationRepository = UserAuthenticationRepository();
  
  Stream get authState => _userAuthenticationRepository.authState;
  Future<User> get currentUser => _userAuthenticationRepository.currentUser;
  Future<User> signInWithGoogle() => _userAuthenticationRepository.signInWithGoogle();
  signOutWithGoogle() => _userAuthenticationRepository.signOutWithGoogle();

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}