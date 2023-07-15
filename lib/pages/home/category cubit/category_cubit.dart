import 'package:ecommerce_app/data/models/category/category_model.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/pages/home/category%20cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState()) {
    _initialize();
  }

  final _categoryRepository = CategoryRepository();
  void _initialize() async {
    emit(CategoryLoadingState(state.categories));
    try {
      List<CategoryModel> categories =
          await _categoryRepository.fetchAllCategories();
      emit(CategoryLoadedState(categories));
    } catch (e) {
      emit(CategoryErrorState(e.toString(), state.categories));
    }
  }
}
