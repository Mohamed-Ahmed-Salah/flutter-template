import 'package:flutter_template/models/users.dart';

class Login {
  Future<Users> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return Users(
        userId: 'userId', name: 'name', email: email, phone: '+249955');
  }
}
