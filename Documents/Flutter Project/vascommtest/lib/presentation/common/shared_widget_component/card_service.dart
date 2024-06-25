import 'package:flutter/material.dart';

class CardService extends StatelessWidget {

  const CardService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Container(
          width: double.infinity,
          height: 165,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // Arah bayangan (x, y)
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: const Text(
                        'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'Rp. 1.400.000',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Lenmarc Surabaya',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Dukuh Pakis, Surabaya',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/images/service_image.png',
                    fit: BoxFit.fitHeight),
              )
            ],
          ),
        ),
      ),
    );
  }
}
