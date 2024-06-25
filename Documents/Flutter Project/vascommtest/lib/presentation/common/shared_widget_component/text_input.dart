import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/colors_constant.dart';

class TextInputShared extends StatefulWidget {
  final String text;
  final String textPlaceHolder;
  final bool isPassword;
  final bool isLogin;
  const TextInputShared(
      {super.key,
      required this.text,
      required this.textPlaceHolder,
      required this.isPassword,
      required this.isLogin});

  @override
  State<TextInputShared> createState() => _TextInputSharedState();
}

class _TextInputSharedState extends State<TextInputShared> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isPassword && widget.isLogin
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ColorSharedConstant.colorTitleBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Lupa Password anda ?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: ColorSharedConstant.colorTitleBlue,
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: ColorSharedConstant.colorTitleBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

        const SizedBox(height: 15.0),

        // Jarak antara judul dan input
        widget.isPassword
            ? Container(
                decoration: BoxDecoration(
                  color: ColorSharedConstant.colorBackWhite,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: widget.textPlaceHolder, // Placeholder
                    contentPadding:
                        const EdgeInsets.all(16.0), // Padding dalam input
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  color: ColorSharedConstant.colorBackWhite,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: widget.textPlaceHolder,
                    contentPadding: const EdgeInsets.all(16.0),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
      ],
    );
  }
}
