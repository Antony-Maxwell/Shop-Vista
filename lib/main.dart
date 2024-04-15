import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_vista/application/home/banners_bloc/banners_bloc_bloc.dart';
import 'package:shop_vista/application/home/bottom_navigation_bloc/bloc/bottom_navigation_bloc.dart';
import 'package:shop_vista/application/home/categories/bloc/categories_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/get_wishlist/getwishlist_bloc.dart';
import 'package:shop_vista/application/home/page_indicator/bloc/page_indicator_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/home/wishlist/wishlist_bloc.dart';
import 'package:shop_vista/application/store/brand_bloc/brand_bloc.dart';
import 'package:shop_vista/application/store/cart_quantity/cart_count_bloc.dart';
import 'package:shop_vista/infrastructure/home/category/categories_impl.dart';
import 'package:shop_vista/domain/core/di/injectable.dart';
import 'package:shop_vista/presentation/auth/on_boarding_one.dart';
import 'package:shop_vista/presentation/routes/genarated_routes.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';
import 'package:shop_vista/utils/theme/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesBloc>(
          create: (context) =>
              CategoriesBloc(categoryRepository: CategoryRepository()),
        ),
        BlocProvider(create: (context) => getIt<GetwishlistBloc>(),),
        BlocProvider(create: (context) => getIt<BannersBlocBloc>()),
        BlocProvider(create: (context) => getIt<GetCartBloc>()),
        BlocProvider(create: (context) => getIt<ProductsBloc>()),
        BlocProvider(create: (context) => getIt<UserBloc>(),),
        BlocProvider(create: (context) => getIt<BrandBloc>(),),
        BlocProvider<CartCountBloc>(create: (context) => CartCountBloc(),),
        BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc()),
        BlocProvider<PageIndicatorBloc>(
            create: (context) => PageIndicatorBloc()),
        BlocProvider<WishlistBloc>(create: (context) => WishlistBloc(),),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator().generateRoute,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                if (snapshot.hasData) {
                  User? user = snapshot.data;
                  if (user!.emailVerified) {
                    return NavigationMenu();
                  } else {
                    return OnBoardingOne();
                  }
                } else {
                  return OnBoardingOne();
                }
              }
              // return SplashScreen();
            }),
      ),
    );
  }
}
