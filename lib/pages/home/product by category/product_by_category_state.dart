part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryState {
  final List<ProductModel> products;
  ProductByCategoryState(this.products);
}

abstract class ProductByCategoryActionState extends ProductByCategoryState {
  ProductByCategoryActionState(super.products);
}

class ProductByCategoryInitialState extends ProductByCategoryState {
  ProductByCategoryInitialState() : super([]);
}

class ProductByCategoryLoadingState extends ProductByCategoryState {
  ProductByCategoryLoadingState(super.products);
}

class ProductByCategoryLoadedState extends ProductByCategoryState {
  ProductByCategoryLoadedState(super.products);
}

class ProductByCategoryErrorState extends ProductByCategoryState {
  final String errMessage;
  ProductByCategoryErrorState(this.errMessage, super.products);
}
