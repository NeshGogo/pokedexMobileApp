import 'user_cloud_firebase_api.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';

class UserCloudFirebaseRepository{
  final _cloudFirebaseApi = UserCloudFirebaseApi();

  void updateOrSetUser(User user) => _cloudFirebaseApi.updateOrSetUser(user);
}