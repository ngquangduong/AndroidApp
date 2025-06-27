import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/input.dart';

class NewPassword extends StatelessWidget {
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
            child: Container(
              height: 175,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  // Nút quay lại ở góc trên trái
                  Positioned(
                    top: 40,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  // Tiêu đề ở chính giữa
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Text(
                        'Mật khẩu mới',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      SizedBox(height: 15),
                      Input(
                        label: 'Nhập lại mật khẩu',
                        hintText: 'Nhập lại mật khẩu',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Hãy nhập lại mật khẩu';
                          }
                          return null;
                        },
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