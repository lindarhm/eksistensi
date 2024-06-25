import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/elevated_button.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/text_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Column(
          children: [
            const TextInputShared(
              text: 'Nama Depan',
              textPlaceHolder: 'Jhon',
              isPassword: false,
              isLogin: false,
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const TextInputShared(
                text: 'Nama Belakang',
                textPlaceHolder: 'Doe',
                isPassword: false,
                isLogin: false,
              ),
            ),
            const SizedBox(height: 12.0),
            const TextInputShared(
              text: 'No. KTP',
              textPlaceHolder: 'Masukkan No. KTP anda',
              isPassword: false,
              isLogin: false,
            ),
            const SizedBox(height: 12.0),
            const TextInputShared(
              text: 'Email',
              textPlaceHolder: 'Masukkan email anda',
              isPassword: false,
              isLogin: false,
            ),
            SizedBox(height: 12.0),
            Container(
              child: const TextInputShared(
                text: 'No. Telpon',
                textPlaceHolder: 'Masukkan password anda',
                isPassword: false,
                isLogin: false,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const TextInputShared(
                text: 'Password',
                textPlaceHolder: 'Masukkan password anda',
                isPassword: true,
                isLogin: false,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const TextInputShared(
                text: 'Konfirmasi Password',
                textPlaceHolder: 'Konfirmasi password anda',
                isPassword: true,
                isLogin: false,
              ),
            ),
            const ElevatedButtonShared(
              text: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
