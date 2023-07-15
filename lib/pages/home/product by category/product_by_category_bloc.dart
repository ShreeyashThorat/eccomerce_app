import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/models/product/product_model.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  ProductByCategoryBloc() : super(ProductByCategoryInitialState()) {
    on<ProductByCategoryInitialEvent>(_initialize);
  }

  final productRepository = ProductRepository();
  void _initialize(ProductByCategoryInitialEvent event,
      Emitter<ProductByCategoryState> emit) async {
    emit(ProductByCategoryLoadingState(state.products));
    try {
      List<ProductModel> products =
          await productRepository.fetchProductsByCategory(event.categoryId);
      emit(ProductByCategoryLoadedState(products));
    } catch (e) {
      emit(ProductByCategoryErrorState(e.toString(), state.products));
    }
  }
}
