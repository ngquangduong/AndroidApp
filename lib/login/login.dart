import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'components/socialLogin.dart';
import 'newPassword.dart';
import 'components/input.dart';
import 'components/socialLogin.dart';
import 'createAccount.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0xFF1A30B0), Color(0xFF0A0059)],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: Size.fromHeight(175),
              child: AppBar(
                toolbarHeight: 175,
                title: Text(
                  'Đăng nhập',
                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white),
              ),
            ),
          ),
          Positioned.fill(
            top: 175,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Input(
                        label: 'Tên đăng nhập',
                        hintText: 'Nhập tên đăng nhập',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Hãy nhập tên đăng nhập';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      Input(
                        label: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Hãy nhập mật khẩu';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              // Xử lý logic quên mật khẩu ở đây
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NewPassword()),
                              );
                            },
                            child: Text(
                              'Quên mật khẩu?',
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                          ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF006EFF), Color(0xFF003377)],
                          ),
                        ),
                        child: SizedBox (
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              textStyle: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {
                              // Xử lý logic đăng nhập ở đây
                            },
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      RichText(
                        text: TextSpan(
                          text: 'Bạn chưa có tài khoản? ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: 'Đăng ký',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // 👉 Điều hướng khi nhấn vào "Đăng ký"
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CreateAccount()),
                                  );
                                  print('Đã nhấn Đăng ký');
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'HOẶC',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialLoginButton(
                            imagePath: 'lib/images/google.png',
                            borderColor: Colors.redAccent,
                          ),
                          SocialLoginButton(
                            imagePath: 'lib/images/facebook.png',
                            borderColor: Colors.blueAccent,
                          ),
                          SocialLoginButton(
                            imagePath: 'lib/images/fingerprint.png',
                            borderColor: Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}