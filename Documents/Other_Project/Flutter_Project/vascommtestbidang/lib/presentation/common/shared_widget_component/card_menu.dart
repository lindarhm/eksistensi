import 'package:flutter/material.dart';
import 'package:vascommtestbidang/presentation/common/colors_constant.dart';

class CardMenu extends StatelessWidget {
  final bool isGradient;
  final bool isisLeftImage;
  final bool isButton;
  final String title;
  final String description;
  final String imageUrl;
  final String linkButton;

  const CardMenu(
      {super.key,
      required this.isGradient,
      required this.isisLeftImage,
      required this.isButton,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.linkButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isisLeftImage ? Container(
        height: 200,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 165,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // Arah bayangan (x, y)
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        isGradient ? Color(0xFFDAE9F9) : Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white
                      ], // Gradasi warna biru-putih
                      begin: Alignment.centerRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 100.0, // Tinggi gambar
                           // Margin untuk menggeser gambar ke kiri
                          child: Image.asset(imageUrl)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10),
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 200,
                                child: Text(
                                  description,
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                              ),
                            ),
                            isButton
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextButton(
                                      onPressed: () {
                                        // Aksi yang akan diambil saat tombol ditekan
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: ColorSharedConstant
                                            .colorTitleBlue, // Mengatur warna latar belakang
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Mengatur sudut yang bulat
                                        ),
                                      ),
                                      child: Text(
                                        linkButton,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16), // Mengatur warna teks
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(linkButton,
                                            style: const TextStyle(
                                                color: ColorSharedConstant
                                                    .colorTitleBlue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(Icons.arrow_forward,
                                              color: ColorSharedConstant
                                                  .colorTitleBlue),
                                        )
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ) : Container(
        height: 200,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 165,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // Arah bayangan (x, y)
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        isGradient ? Color(0xFFDAE9F9) : Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white
                      ], // Gradasi warna biru-putih
                      begin: Alignment.centerRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 220,
                            child: Text(
                              description,
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ),
                        isButton
                            ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextButton(
                            onPressed: () {
                              // Aksi yang akan diambil saat tombol ditekan
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: ColorSharedConstant
                                  .colorTitleBlue, // Mengatur warna latar belakang
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Mengatur sudut yang bulat
                              ),
                            ),
                            child: Text(
                              linkButton,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16), // Mengatur warna teks
                            ),
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(linkButton,
                                  style: const TextStyle(
                                      color: ColorSharedConstant
                                          .colorTitleBlue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(Icons.arrow_forward,
                                    color: ColorSharedConstant
                                        .colorTitleBlue),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -30,
              right: 2,
              child: Container(
                  height: 170.0, // Tinggi gambar
                  margin: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0), // Margin untuk menggeser gambar ke kiri
                  child: Image.asset(imageUrl)),
            ),
          ],
        ),
      ),
    );
  }
}
