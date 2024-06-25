import 'package:flutter/material.dart';
import 'package:vascommtestbidang/presentation/common/colors_constant.dart';
import 'package:vascommtestbidang/presentation/main/main_page.dart';

class ElevatedButtonShared extends StatelessWidget {
  final String text;
  final bool isProfile;

  const ElevatedButtonShared({super.key, required this.text, required this.isProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25.0),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorSharedConstant.colorTitleBlue,
                    onPrimary: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Radius tepi 8
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Icon(isProfile ? Icons.save : Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
