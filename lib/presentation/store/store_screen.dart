import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_vista/application/store/brand_bloc/brand_bloc.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/tabbar.dart';
import 'package:shop_vista/presentation/widgets/product_cart/cart_menu_icon.dart';
import 'package:shop_vista/presentation/widgets/search_container/search_container.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/brand_headline.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/category_tabbar_view.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/featured_brand_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child:
                  TCartCounterIcon(
                    userId: 00,
                    onPressed: () {}, iconColor: Colors.black),
            )
          ],
        ),
        body: BlocBuilder<BrandBloc, BrandState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,
                    height: 75,
                    color: Colors.white,
                  ),
                ),
              );
            }
            return NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? Colors.black
                        : Colors.white,
                    expandedHeight: 300,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          TSearchBarWidget(
                            text: 'Search in Store',
                          ),
                          const SizedBox(height: 10),
                          BrandHeadline(
                            id: state.brands!,
                          ),
                          FeraturedBrands(
                            id: state.brands!.take(4).toList(),
                            brandLogo: state.brands!.take(4).toList(),
                            brandName: state.brands!.take(4).toList(),
                            count: 4,
                          ),
                        ],
                      ),
                    ),
                    bottom: const TTabBar(
                      tabs: [
                        Tab(child: Text('Sports')),
                        Tab(child: Text('Furniture')),
                        Tab(child: Text('Books')),
                        Tab(child: Text('Shoes')),
                        Tab(child: Text('Clothes')),
                      ],
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: [
                  TCategoryTabView(
                    id: state.brands![0].id,
                    logo: state.brands![0].image,
                    name: state.brands![0].name,
                  ),
                  TCategoryTabView(
                    id: state.brands![1].id,
                    logo: state.brands![1].image,
                    name: state.brands![1].name,
                  ),
                  TCategoryTabView(
                    id: state.brands![2].id,
                    logo: state.brands![2].image,
                    name: state.brands![2].name,
                  ),
                  TCategoryTabView(
                    id: state.brands![3].id,
                    logo: state.brands![3].image,
                    name: state.brands![3].name,
                  ),
                  TCategoryTabView(
                    id: state.brands![3].id,
                    logo: state.brands![3].image,
                    name: state.brands![3].name,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
