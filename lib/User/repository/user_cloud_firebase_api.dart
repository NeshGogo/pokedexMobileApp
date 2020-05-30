import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';

class UserCloudFirebaseApi {
  
  static const String _users = 'users';
  final  _db = Firestore.instance; 
  final _auth = FirebaseAuth.instance;

  void updateOrSetUser(User user) async{
    var ref = _db.collection(_users).document(user.id);
    bool userExist= (await _db.collection(_users).document(user.id).get()).exists;
    if(!userExist){
      ref.setData({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'favoritePokemons': [],
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

  void addOrRemoveFavoritePokemon(String userId, Pokemon pokemon){
    _db.collection(_users).document(userId).get().then((userSnapshot){
      var ref = _db.collection(_users).document(userId);
      List favoritesPokemon = userSnapshot.data['favoritePokemons'];
      
      ref.updateData({        
        'favoritePokemons': (favoritesPokemon.length == 0 || !favoritesPokemon.contains(pokemon.id))? 
          FieldValue.arrayUnion([pokemon.id]) : FieldValue.arrayRemove([pokemon.id]),
      });    
    });
  }
  Future<List<int>> getFavoritePokemons() async{
    String userId = (await _auth.currentUser()).uid;
    List result = await _db.collection(_users).document(userId).get().then((userSnapshot) => userSnapshot.data['favoritePokemons']);
    return result.length>0? <int>[...result] : List<int>();
  }
}