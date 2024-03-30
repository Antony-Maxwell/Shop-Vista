import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/bottom_navigation_bloc/bloc/bottom_navigation_bloc.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class RouteGenerator {
  final BottomNavigationBloc navigationBloc = BottomNavigationBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BottomNavigationBloc>.value(
            value: navigationBloc,
            child: const NavigationMenu(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Error',
            ),
          ),
          body: const Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
