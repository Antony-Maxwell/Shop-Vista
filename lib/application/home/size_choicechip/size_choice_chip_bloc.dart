import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'size_choice_chip_event.dart';
part 'size_choice_chip_state.dart';

class SizeChoiceChipBloc extends Bloc<SizeChoiceChipEvent, SizeChoiceChipState> {
  SizeChoiceChipBloc() : super(SizeChoiceChipState(0, 'Size')) {
    on<SelectChoiceChipSize>(_onSelectChoiceChipSize);
  }

  void _onSelectChoiceChipSize(SelectChoiceChipSize event, Emitter<SizeChoiceChipState> emit){
    emit(SizeChoiceChipState(event.index, event.value));
  }
}
