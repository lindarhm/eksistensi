import 'package:equatable/equatable.dart';
import 'package:tdd/domain/entities/product_entities.dart';

class ProductModel implements Equatable {
  final int id;
  final String nama;
  final int harga;
  final String tipe;
  final String gambar;

  const ProductModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.tipe,
    required this.gambar,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      tipe: json['tipe'],
      gambar: json['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'tipe': tipe,
      'gambar': gambar,
    };
  }

  //identify detail data from response for TDD
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
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

  Product toEntity() {
    return Product(
      id: id,
      nama: nama,
      harga: harga,
      tipe: tipe,
      gambar: gambar,
    );
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
