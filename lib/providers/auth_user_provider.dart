import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/my_user.dart';

class AuthUserProvider extends ChangeNotifier{
  ///data
  MyUser? currentUser;

  ///func take new user
  void updateUser(MyUser newUser){
    currentUser = newUser;
    notifyListeners();
  }
}