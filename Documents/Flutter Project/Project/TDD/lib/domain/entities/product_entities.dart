import 'package:equatable/equatable.dart';

class Product implements Equatable {
  final int id;
  final String nama;
  final int harga;
  final String tipe;
  final String gambar;

  const Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.tipe,
    required this.gambar,
  });

  //identify detail data from response for TDD
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.nama == nama &&
        other.harga == harga &&
        other.tipe == tipe &&
        other.gambar == gambar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    nama.hashCode ^
    harga.hashCode ^
    tipe.hashCode ^
    gambar.hashCode;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    nama,
    harga,
    tipe,
    gambar,
  ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}