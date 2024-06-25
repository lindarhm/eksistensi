import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tdd/domain/usecase/product_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUsecase _productUsecase;

  ProductBloc(this._productUsecase) : super(ProductInitial()) {
    on<GetAllProductEvent>(
          (event, emit) async {
        emit(ProductLoading());

        final result = await _productUsecase.execute();
        result.fold(
              (failure) {
            emit(ProductError(failure.message));
          },
              (data) {
            emit(ProductData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
