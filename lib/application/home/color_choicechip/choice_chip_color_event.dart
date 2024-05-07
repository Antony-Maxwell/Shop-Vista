part of 'choice_chip_color_bloc.dart';

abstract class ChoiceChipColorEvent {}

class SelectChoiceChip extends ChoiceChipColorEvent {
  final int index;
  final String value;

  SelectChoiceChip(this.index, this.value);
}