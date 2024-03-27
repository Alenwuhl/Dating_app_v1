import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(UserModel user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } catch (e) {
      print(e);  // Considera manejar los errores de manera más adecuada.
    }
  }
}
