import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vascommtestbidang/presentation/authantication/auth_page.dart';
import 'package:vascommtestbidang/presentation/common/colors_constant.dart';
import 'package:vascommtestbidang/presentation/main/home/home_page.dart';
import 'package:vascommtestbidang/presentation/main/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool showContent = false;
  bool profilePage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorSharedConstant.backProfile,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => setState(() {
                    showContent = true;
                  }),
                );
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart,
                      color: ColorSharedConstant.colorTitleBlue),
                  onPressed: () {
                    // Aksi ketika ikon pertama ditekan
                  },
                ),
              ),
              const Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      FontAwesomeIcons.solidBell,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Center(
            //child: ProfilePage(),
            child: profilePage == true ? ProfilePage() : HomePage(),
          ),
        ),
        if (showContent == true)
          Stack(
            children: [
              Container(
                color: ColorSharedConstant.colorTitleBlue.withOpacity(0.8),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: GestureDetector(
                  onTap: () => setState(() {
                    showContent = false;
                  }),
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: 360,
                  child: Container(
                    color: Colors.white,
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.black),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 90, left: 20),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://tse1.mm.bing.net/th?q=profil%20wa%20aesthetic&w=1280&h=760&c=5&rs=1&p=0', // Ganti dengan URL gambar Anda
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Angga Praja',
                                        style: TextStyle(
                                            color: ColorSharedConstant
                                                .colorTitleBlue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Membership BBLK',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 40),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    profilePage = true;
                                    showContent = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 70),
                                      child: Text(
                                        'Profile Saya',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 70),
                                  child: Text(
                                    'Pengaturan',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                profilePage = false;
                                showContent = false;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 110),
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 50),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70, vertical: 5),
                                ),
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Ikuti kami di'),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(FontAwesomeIcons.facebook, size: 20),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(FontAwesomeIcons.instagram, size: 20),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(FontAwesomeIcons.twitter, size: 20)
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 40, right: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('FAQ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('Term and Condition',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )
      ],
    );
  }
}
