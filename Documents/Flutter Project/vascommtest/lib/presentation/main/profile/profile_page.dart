import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/colors_constant.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/elevated_button.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/icon_rounded.dart';
import 'package:testvascomm/presentation/common/shared_widget_component/text_input.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isProfileSelected = true;

  void toggleTab() {
    setState(() {
      isProfileSelected = !isProfileSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorSharedConstant.backProfile,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 2,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (!isProfileSelected) {
                                  toggleTab();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: isProfileSelected
                                      ? const Color(0xFF00D9D5)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                                child: Text(
                                  '  Profile Saya  ',
                                  style: TextStyle(
                                      color: ColorSharedConstant.colorTitleBlue,
                                      fontWeight: isProfileSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (isProfileSelected) {
                                  toggleTab();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: isProfileSelected
                                      ? Colors.white
                                      : const Color(0xFF00D9D5),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Text(
                                  '  Pengaturan  ',
                                  style: TextStyle(
                                      color: ColorSharedConstant.colorTitleBlue,
                                      fontWeight: isProfileSelected
                                          ? FontWeight.normal
                                          : FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 170,
                              left: 16.0,
                              right: 16.0,
                              child: Container(
                                width: 500.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, left: 20, right: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                              'Pilih data yang ingin ditampilkan',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: ColorSharedConstant
                                                      .colorTitleBlue,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const SizedBox(height: 20),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                IconRounded(
                                                    icon: 'account',
                                                    colorBackground:
                                                        Color(0xFF00D9D5),
                                                    colorIcon:
                                                        ColorSharedConstant
                                                            .colorTitleBlue),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Data Diri',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: ColorSharedConstant
                                                                  .colorTitleBlue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(
                                                          'Data diri anda sesuai KTP',
                                                          style: TextStyle(
                                                              fontSize: 10.0,
                                                              color:
                                                                  ColorSharedConstant
                                                                      .greyText)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconRounded(
                                                icon: 'location',
                                                colorBackground:
                                                    Color(0xFFEBEDF7),
                                                colorIcon: Colors.black12),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: const TextInputShared(
                                          text: 'Nama Depan',
                                          textPlaceHolder: 'Jhon',
                                          isPassword: false,
                                          isLogin: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const TextInputShared(
                                        text: 'Nama Belakang',
                                        textPlaceHolder: 'Doe',
                                        isPassword: false,
                                        isLogin: false,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const TextInputShared(
                                        text: 'Email',
                                        textPlaceHolder: 'Masukkan email anda',
                                        isPassword: false,
                                        isLogin: false,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const TextInputShared(
                                        text: 'No Telpon',
                                        textPlaceHolder:
                                            'Masukkan no telpon anda',
                                        isPassword: false,
                                        isLogin: false,
                                      ),
                                      const SizedBox(height: 20),
                                      const TextInputShared(
                                        text: 'No. KTP',
                                        textPlaceHolder: 'Masukkan no KTP anda',
                                        isPassword: false,
                                        isLogin: false,
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            color: ColorSharedConstant
                                                .colorTitleBlue,
                                            icon: const Icon(
                                                Icons.info), // Ikon Drawer Kiri
                                            onPressed: () {
                                              Scaffold.of(context)
                                                  .openDrawer(); // Buka Drawer Kiri
                                            },
                                          ),
                                          Container(
                                              width: 250,
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                  'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: ColorSharedConstant
                                                        .greyText,
                                                  ))),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const ElevatedButtonShared(
                                        text: 'Simpan Profile',
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              )),
                          Positioned(
                            top: 0,
                            left: 16.0,
                            right: 16.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorSharedConstant.colorTitleBlue,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: 170,
                              margin: const EdgeInsets.all(0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(30),
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
                                      padding: EdgeInsets.only(left: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Angga Praja',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: ColorSharedConstant
                                                    .whiteText,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Membership BBLK',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: ColorSharedConstant
                                                    .greyText,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 135,
                            left: 16.0,
                            right: 16.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ColorSharedConstant.slateTitleInputBlue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              height: 55,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                  child: Text(
                                    'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
                                    style: TextStyle(
                                        color: ColorSharedConstant.whiteText,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  color: ColorSharedConstant.colorTitleBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 170,
                          child: const Text('Ingin mendapat update dari kami ?',
                              style: TextStyle(
                                  color: ColorSharedConstant.whiteText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                        const SizedBox(
                          width: 66,
                          child: Text('Dapatkan notifikasi',
                              style: TextStyle(
                                  color: ColorSharedConstant.whiteText,
                                  fontSize: 14)),
                        ),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
