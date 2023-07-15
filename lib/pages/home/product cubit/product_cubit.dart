import 'package:ecommerce_app/data/models/product/product_model.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/pages/home/product%20cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState()) {
    _initialize();
  }

  final productRepository = ProductRepository();
  void _initialize() async {
    emit(ProductLoadingState(state.products));
    try {
      List<ProductModel> products = await productRepository.fetchAllProducts();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString(), state.products));
    }
  }
}
