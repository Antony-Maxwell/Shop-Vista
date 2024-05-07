part of 'size_choice_chip_bloc.dart';

abstract class SizeChoiceChipEvent {}

class SelectChoiceChipSize extends SizeChoiceChipEvent{
  final int index;
  final String value;

  SelectChoiceChipSize (this.index, this.value);
}
