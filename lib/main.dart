import 'package:flutter/material.dart';
import 'package:namer_app/login/createAccount.dart';
import 'package:namer_app/login/newPassword.dart';
import 'login.dart';
import 'login/login.dart';
import 'login/createAccount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Demo',
      home: Login(),
      // home: CreateAccount(),
      // home: NewPassword()
    );
  }
}
