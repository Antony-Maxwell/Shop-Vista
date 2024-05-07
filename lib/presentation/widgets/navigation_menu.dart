import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/bottom_navigation_bloc/bloc/bottom_navigation_bloc.dart';
import 'package:shop_vista/presentation/home/home_screen.dart';
import 'package:shop_vista/presentation/profile/profile_screen.dart';
import 'package:shop_vista/presentation/store/store_screen.dart';
import 'package:shop_vista/presentation/wishlist/wishlist_screen.dart';

List<NavigationDestination> bottomNavItems = const <NavigationDestination>[
  NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
  NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
  NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
  NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
];

List<Widget> bottomNavScreens = <Widget>[
  const HomeScreen(),
  const StoreScreen(),
  const WishlistScreen(),
  const ProfileScreen(),
];

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomNavScreens.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: NavigationBar(
            elevation: 0,
            height: 80,
            destinations: bottomNavItems,
            selectedIndex: state.tabIndex,
            onDestinationSelected: (value) {
              BlocProvider.of<BottomNavigationBloc>(context).add(TabChange(tabIndex: value));
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
