import 'package:flutter/material.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/elevated_button.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/text_input.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              TextInputShared(
                text: 'Email',
                textPlaceHolder: 'Masukkan email anda',
                isPassword: false,
                isLogin: true,
                textInputAction: TextInputAction.next,
                controller: _emailController,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: TextInputShared(
                  text: 'Password',
                  textPlaceHolder: 'Masukkan password anda',
                  isPassword: true,
                  isLogin: true,
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                ),
              ),
              ElevatedButtonShared(
                text: 'Login',
                isProfile: false,
              )
            ],
          ),
        ),
      );
  }
}