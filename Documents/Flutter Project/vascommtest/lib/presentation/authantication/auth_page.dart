import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testvascomm/presentation/authantication/authpage/login_page.dart';
import 'package:testvascomm/presentation/authantication/authpage/register_page.dart';
import 'package:testvascomm/presentation/common/colors_constant.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: ColorSharedConstant.colorBackWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: screenWidth * 12 / 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 5 / 100),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hai, ',
                            style: TextStyle(
                              color: ColorSharedConstant.colorTitleBlue,
                              fontSize: 28.0,
                            ),
                          ),
                          TextSpan(
                            text: 'Selamat Datang',
                            style: TextStyle(
                              color: ColorSharedConstant.colorTitleBlue,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 5 / 100),
                    child: const Text(
                      "Silahkan login untuk melanjutkan",
                      style: TextStyle(
                        color: ColorSharedConstant.slateTitleInputBlue,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/images/auth.png')),
                  isRegister == true ? RegisterPage() : LoginPage(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum punya akun ?',
                        style: TextStyle(
                            color: ColorSharedConstant.greyText, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isRegister = !isRegister;
                          });
                        },
                        child: Text(
                          isRegister == true
                              ? '  Login sekarang' : '  Daftar sekarang',
                          style: const TextStyle(
                            color: ColorSharedConstant.colorTitleBlue,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.copyright, // Ikon hak cipta
                        size: 14.0,
                        color: ColorSharedConstant.greyText,
                      ),
                      Text('  SILK. all right reserved.',
                          style: TextStyle(
                            color: ColorSharedConstant.greyText,
                            fontSize: 14,
                          )),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ));
  }
}
