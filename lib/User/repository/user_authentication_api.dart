import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';

class UserAuthenticationAPI {
  
  final _googleAuth = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;
  
  Stream<FirebaseUser> _streamFirebase =  FirebaseAuth.instance.onAuthStateChanged;
  
  Stream<FirebaseUser> get authState => _streamFirebase;
  Future<User> get currentUser  async => _buildUser(await FirebaseAuth.instance.currentUser());

  User _buildUser(FirebaseUser user){
    return User(
      id: user.providerId,
      name: user.displayName,
      email: user.email,
      photoUrl: user.photoUrl,
    );
  }

  Future<User> signInWithGoogle() async{
    var signInAccount = await  _googleAuth.signIn();
    var signInAuthentication =  await signInAccount.authentication;
    var credential = GoogleAuthProvider.getCredential(
      idToken: signInAuthentication.idToken, 
      accessToken: signInAuthentication.accessToken
    );
    var user = (await _firebaseAuth.signInWithCredential(credential)).user;

    return _buildUser(user);
  }
  signOutWithGoogle() async{
    await _firebaseAuth.signOut();
    await _googleAuth.signOut();
  }
}
