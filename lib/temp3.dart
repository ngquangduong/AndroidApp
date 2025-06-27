import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sử dụng Stack để chồng các widget lên nhau
      body: Stack(
        children: [
          // Lớp nền Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0xFF1A30B0), Color(0xFF0A0059)],
              ),
            ),
          ),
          // AppBar tùy chỉnh
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: Size.fromHeight(200),
              child: AppBar(
                title: Text(
                  'Đăng nhập',
                  style: TextStyle(color: Colors.white), // Đảm bảo chữ màu trắng
                ),
                backgroundColor: Colors.transparent, // Nền trong suốt
                elevation: 0, // Bỏ đổ bóng của AppBar
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white), // Màu cho nút back (nếu có)
              ),
            ),
          ),
          // Khu vực nội dung đăng nhập
          Positioned.fill(
            top: 150, // Điều chỉnh vị trí bắt đầu của khu vực trắng (dưới AppBar)
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0), // Bo góc trên bên trái
                  topRight: Radius.circular(30.0), // Bo góc trên bên phải
                ),
              ),
              child: SingleChildScrollView( // Cho phép cuộn nếu nội dung dài
                padding: EdgeInsets.all(30.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20), // Khoảng đệm phía trên
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Tên đăng nhập',
                          border: OutlineInputBorder( // Thêm viền cho input
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100], // Màu nền nhẹ cho input
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Hãy nhập tên đăng nhập';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Hãy nhập mật khẩu';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1A30B0), // Màu nút giống màu nền
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // Xử lý logic đăng nhập ở đây
                        },
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white), // Chữ màu trắng
                        ),
                      ),
                      SizedBox(height: 20), // Khoảng đệm phía dưới
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