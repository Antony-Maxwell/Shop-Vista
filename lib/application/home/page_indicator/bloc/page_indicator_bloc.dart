import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_indicator_event.dart';
part 'page_indicator_state.dart';

class PageIndicatorBloc extends Bloc<PageIndicatorEvent, PageIndicatorState> {
  PageIndicatorBloc() : super(PageIndicatorState()) {
    on<PageIndicatorEvent>((event, emit) {
      emit(PageIndicatorState(page: state.page));
    });
  }
}
