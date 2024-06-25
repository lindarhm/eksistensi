import 'package:equatable/equatable.dart';
import 'package:tdd/domain/entities/product_entities.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState{}

class ProductLoading extends ProductState{}

class ProductError extends ProductState{
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductData extends ProductState{
  final List<Product> result;

  ProductData(this.result);

  @override
  List<Object?> get props => [result];
}

