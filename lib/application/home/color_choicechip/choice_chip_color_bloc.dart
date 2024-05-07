import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choice_chip_color_event.dart';
part 'choice_chip_color_state.dart';

class ChoiceChipColorBloc extends Bloc<ChoiceChipColorEvent, ChoiceChipColorState> {
  ChoiceChipColorBloc() : super(ChoiceChipColorState(0,'color')) {
    on<SelectChoiceChip>(_onSelectChoiceChip);
  }

  void _onSelectChoiceChip(SelectChoiceChip event, Emitter<ChoiceChipColorState> emit) {
    emit(ChoiceChipColorState(event.index, event.value));
  }
}