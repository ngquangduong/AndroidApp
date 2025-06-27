import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'products.dart';

//API from DummyJSON https://dummyjson.com/auth/login for login
Future<void> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('https://dummyjson.com/auth/login'),
    body: {
      'username': username,
      'password': password,
    }
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
  } else {
    throw 'Sai tài khoản hoặc mật khẩu.';
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String message = '';
  void checkLogin() async {
    setState(() {
      message = 'Đang đăng nhập...';
    });
    try {
      await login(usernameController.text, passwordController.text);

      setState(() {
        message = 'Đăng nhập thành công!';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => productsList()),
      );
    } catch (e) {
      setState(() {
        message = 'Đăng nhập thất bại: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Tên đăng nhập'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hãy nhập tên đăng nhập';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Mật khẩu'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hãy nhập mật khẩu';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(message),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Xử lý logic đăng nhập ở đây
                        String username = usernameController.text;
                        String password = passwordController.text;
                        print('Tài khoản: $username');
                        print('Mật khẩu: $password');
                      }
                      checkLogin();
                      // Xử lý đăng nhập ở đây
                    },
                    child: Text('Đăng nhập'),
                )
              ],
            ),
        ),
      )
    );
  }
}