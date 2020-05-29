import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';

class UserCloudFirebaseApi {
  
  static const String _users = 'users';
  final  _db = Firestore.instance; 

  void updateOrSetUser(User user) async{
    var ref = _db.collection(_users).document(user.id);
    bool userExist= (await _db.collection(_users).document(user.id).get()).exists;
    if(!userExist){
      ref.setData({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'favoritePokemons': user.favoritePokemons,
        'lastSignIn': DateTime.now()
      });
    }else{
      ref.updateData({
        'name': user.name,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'lastSignIn': DateTime.now()
      });
    }
  }
}