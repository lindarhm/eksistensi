import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/elevated_button.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/text_input.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback? onClick;

  const LoginPage({super.key, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Column(
          children: [
            const TextInputShared(
              text: 'Email',
              textPlaceHolder: 'Masukkan email anda',
              isPassword: false,
              isLogin: true,
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const TextInputShared(
                text: 'Password',
                textPlaceHolder: 'Masukkan password anda',
                isPassword: true,
                isLogin: true,
              ),
            ),
            const ElevatedButtonShared(text: 'Login',)
          ],
        ),
      ),
    );
  }
}
