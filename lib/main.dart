import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_vista/application/home/banners_bloc/banners_bloc_bloc.dart';
import 'package:shop_vista/application/home/bottom_navigation_bloc/bloc/bottom_navigation_bloc.dart';
import 'package:shop_vista/application/home/categories/bloc/categories_bloc.dart';
import 'package:shop_vista/application/home/page_indicator/bloc/page_indicator_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
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
        BlocProvider(create: (context) => getIt<BannersBlocBloc>()),
        BlocProvider(create: (context) => getIt<ProductsBloc>(),),
        BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc()),
        BlocProvider<PageIndicatorBloc>(
          create: (context) => PageIndicatorBloc(),
        )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator().generateRoute,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const NavigationMenu();
              } else {
                return OnBoardingOne();
              }
              // return SplashScreen();
            }),
      ),
    );
  }
}
