import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/colors_constant.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // Arah bayangan (x, y)
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/product_image.png'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Suntik Steril', style: TextStyle(color: ColorSharedConstant.colorTitleBlue, fontSize: 16, fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Rp. 10.000', style: TextStyle(color: Colors.orange, fontSize: 12,fontWeight: FontWeight.bold),),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text('Ready Stok', style: TextStyle(color: Colors.green, fontSize: 10)),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
