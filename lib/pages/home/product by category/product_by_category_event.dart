part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryEvent {}

class ProductByCategoryInitialEvent extends ProductByCategoryEvent {
  final String categoryId;
  ProductByCategoryInitialEvent(this.categoryId);
}
