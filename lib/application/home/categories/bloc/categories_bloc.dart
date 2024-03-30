import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_vista/infrastructure/home/category/categories_impl.dart';
import 'package:shop_vista/domain/categories/model/categories_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryRepository categoryRepository;
  CategoriesBloc({required this.categoryRepository})
      : super(CategoriesInitial()) {
    on<FetchCategories>((_onFetchCategories));
  }

  void _onFetchCategories(
      FetchCategories event, Emitter<CategoriesState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await categoryRepository.getAllCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError('Failed to fetch categories $e'));
    }
  }
}
