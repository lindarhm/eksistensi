import 'package:flutter/material.dart';
import 'package:vascommtestbidang/presentation/common/colors_constant.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/card_menu.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/card_product.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/card_service.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/filter_category.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/icon_rounded.dart';
import 'package:vascommtestbidang/presentation/common/shared_widget_component/search_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isProfileSelected = true;

  void toggleTab() {
    setState(() {
      isProfileSelected = !isProfileSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 3,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const CardMenu(
                      isGradient: true,
                      isisLeftImage: false,
                      title: 'Solusi, Kesehatan Anda',
                      description:
                          'Update informasi seputar kesehatan semua bisa disini !',
                      imageUrl: 'assets/images/icon_menu_1.png',
                      linkButton: 'Selengkapnya',
                      isButton: true,
                    ),
                    const CardMenu(
                      isGradient: false,
                      isisLeftImage: false,
                      title: 'Layanan Khusus',
                      description: 'Tes Covid 19, Cegah Corona Sedini Mungkin',
                      imageUrl: 'assets/images/icon_menu_2.png',
                      linkButton: 'Daftar Tes',
                      isButton: false,
                    ),
                    const CardMenu(
                      isGradient: false,
                      isisLeftImage: true,
                      title: 'Track Pemeriksaan',
                      description:
                          'Kamu dapat mengecek progress pemeriksaanmu disini',
                      imageUrl: 'assets/images/icon_menu_3.png',
                      linkButton: 'Track',
                      isButton: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const IconRounded(
                          icon: 'filter',
                          colorBackground: ColorSharedConstant.colorBackWhite,
                          colorIcon: Colors.black,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(width: 300, child: SearchIput()),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: 60,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              for (var i = 0; i < 10; i++)
                                Container(
                                  color: Colors.white,
                                  child: Center(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: FilterCategory(index: i),
                                  )),
                                ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: Container(
                          height: 185,
                          width: double.infinity,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CardProduct(),
                              );
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Pilih Tipe Layanan Kesehatan Anda',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorSharedConstant.colorTitleBlue,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                  '  Satuan  ',
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
                                  '  Paket Pemeriksaan  ',
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: 400,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              for (var i = 0; i < 10; i++)
                                Container(
                                  color: Colors.white,
                                  child: const Center(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: CardService(),
                                  )),
                                ),
                            ],
                          )),
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
                              child: const Text(
                                  'Ingin mendapat update dari kami ?',
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
                            const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
