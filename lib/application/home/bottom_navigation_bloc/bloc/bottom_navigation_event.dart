part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}

class TabChange extends BottomNavigationEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
