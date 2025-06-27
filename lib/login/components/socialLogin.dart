import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final Color borderColor;

  const SocialLoginButton({
    Key? key,
    required this.imagePath,
    this.borderColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: OutlinedButton(
        onPressed: null, // 👈 Không có sự kiện
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
            color: borderColor,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
