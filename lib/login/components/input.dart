import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? controller;

  const Input({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters = const [],
    this.controller,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool _obscureText;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller ?? TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (!hasFocus) {
                    final error = widget.validator?.call(controller.text);
                    setState(() {
                      _errorText = error;
                    });
                  }
                },
                child: TextFormField(
                  controller: controller,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.inputFormatters,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      widget.icon,
                      color: Colors.blue.shade700,
                    ),
                    suffixIcon: widget.obscureText
                        ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: _errorText != null ? Colors.red : Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: _errorText != null ? Colors.red : const Color(0xFF1A30B0),
                        width: 1.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.red, width: 1.5),
                    ),
                    errorStyle: const TextStyle(height: 0), // Ẩn dòng lỗi mặc định
                  ),
                  // Không dùng validator ở đây để tránh hiển thị trùng
                ),
              ),
            ),
            if (_errorText != null && _errorText!.isNotEmpty)
              const SizedBox(height: 4),
            if (_errorText != null && _errorText!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  _errorText!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
