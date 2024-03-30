part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoryLoading extends CategoriesState {}

class CategoryLoaded extends CategoriesState {
  final List<CategoryModel> Categories;

  CategoryLoaded(this.Categories);
}

class CategoryError extends CategoriesState {
  final String message;
  CategoryError(this.message);
}
