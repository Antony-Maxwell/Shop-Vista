import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/home/search/widgets/brands_grid.dart';
import 'package:shop_vista/presentation/home/search/widgets/categories_list.dart';
import 'package:shop_vista/presentation/home/search/widgets/filter_sheet.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> _isSearching = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        action: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          )
        ],
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: _isSearching,
        builder: (context, isSearching, _) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const SizedBox();
                      }
                      final productList = state.productsList;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onTap: () {
                                    _isSearching.value = true;
                                  },
                                  onChanged: (value) {},
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  FilterSheet().FilterBottomSheet(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: const Center(
                                    child: Icon(Icons.filter),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          kHeight,
                          const TSectionHeading(
                            title: 'Brands',
                            showActionButton: false,
                          ),
                          kHeight,
                          const BrandsGridView(),
                          kHeight,
                          const TSectionHeading(
                            title: 'Categories',
                            showActionButton: false,
                          ),
                          kHeight,
                          const CategoriesGridView(),
                        ],
                      );
                    },
                  ),
                ),
              ),
              if (isSearching)
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return SizedBox();
                    }
                    return Positioned(
                      top: 100,
                      bottom: 20,
                      left: 10,
                      right: 10,
                      child: Container(
                        color: Colors.grey,
                        child: Center(
                            child: ListView.builder(
                          itemCount: state.productsList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final cat = state.productsList[index];
                            return ListTile(
                              title: Text(cat.title!),
                            );
                          },
                        )),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
