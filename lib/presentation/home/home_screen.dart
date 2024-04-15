import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/store/brand_bloc/brand_bloc.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/category.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/grid_view_product.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/home_appbar.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/main_banner_bloc_widget.dart';
import 'package:shop_vista/presentation/widgets/search_container/search_container.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';
import 'package:shop_vista/presentation/widgets/t_primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BrandBloc>(context).add(const GetBrandsList());
  
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: 20),
                  TSearchBarWidget(text: 'Search in Store'),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      TSectionHeading(
                        title: 'Popular Categories',
                        textColor: Colors.white,
                        showActionButton: false,
                      ),
                      SizedBox(height: 10),
                      VerticalCategoryList(),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TMainBannerContainer(),
                  SizedBox(height: 5),
                  TGridViewProduct(
                    mainAxisExnt: 265,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
