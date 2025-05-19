import 'package:flutter/material.dart';
import 'package:test_interview/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;

  bool get isLoggedIn => _user != null;
  UserModel? get user => _user;

  Future<void> login(String name, String password) async {
    if (name == 'admin' && password == '123456') {
      _user = UserModel(id: '1', name: 'Admin');
      notifyListeners();
    } else{
      throw Exception("login gagal");
    }
  }

  void _logout(){
    _user == null;
    notifyListeners();
  }
}
