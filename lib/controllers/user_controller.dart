import '../models/user_model.dart';
import '../services/user_service.dart';

class UserController {
  void registerUser(String email, String password) {
    UserModel user = UserModel(email: email, password: password);
    UserService().registerUser(user);
  }
}
