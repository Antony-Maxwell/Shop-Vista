import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/categories/widgets/category_product.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/detailed_product.dart';
import 'package:shop_vista/presentation/home/search/widgets/brands_grid.dart';
import 'package:shop_vista/presentation/home/search/widgets/categories_list.dart';
import 'package:shop_vista/presentation/home/search/widgets/filter_sheet.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_card.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> _isSearching = ValueNotifier<bool>(false);
  List<Products> filteredProducts = []; // Add a list to store filtered products

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
          return SizedBox(
            height: 900,
            child: Stack(
              children: [
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onTap: () {
                                      _isSearching.value = true;
                                    },
                                    onChanged: (value) {
                                      filterProducts(value, state);
                                    },
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
                                    _isSearching.value = false;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 50,
                                    width: 50,
                                    child: const Center(
                                      child: Icon(Icons.highlight_remove),
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
                        ),
                      ),
                    );
                  },
                ),
                if (isSearching)
                  Positioned(
                    top: 100,
                    left: 10,
                    right: 10,
                    child: Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 150),
                      color: Colors.grey.shade200,
                      child: CustomScrollView(
                        shrinkWrap: true,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return CategoryProductCard(
                                  ontap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailedPage(
                                          amount: filteredProducts[index].price,
                                          salePrice:
                                              filteredProducts[index].salePrice,
                                          productId: filteredProducts[index].id,
                                          subImages:
                                              filteredProducts[index].images!,
                                          mainImage: filteredProducts[index]
                                              .thumbnail!,
                                          attVal1: filteredProducts[index]
                                              .productsAttributes![0]
                                              .values![0]
                                              .toString(),
                                          attVal2: filteredProducts[index]
                                              .productsAttributes![0]
                                              .values![1]
                                              .toString(),
                                          attributes1: filteredProducts[index]
                                              .productsAttributes![0]
                                              .name,
                                          attributes2: filteredProducts[index]
                                              .productsAttributes![1]
                                              .name,
                                          brandName: filteredProducts[index]
                                              .brand!
                                              .name,
                                          description: filteredProducts[index]
                                              .description,
                                          productname:
                                              filteredProducts[index].title,
                                          sizeVals: filteredProducts[index]
                                              .productsAttributes,
                                          stockCount:
                                              filteredProducts[index].stock),
                                    ),
                                  ),
                                  description:
                                      filteredProducts[index].description!,
                                  productName: filteredProducts[index].title!,
                                  brand: filteredProducts[index].brand!.name!,
                                  amount: filteredProducts[index].price,
                                  imageUrl: filteredProducts[index].thumbnail!,
                                );
                              },
                              childCount: filteredProducts.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Method to filter products based on the search text
  void filterProducts(String searchText, ProductsState state) {
    // Reset filteredProducts list
    filteredProducts.clear();

    // If search text is empty, show all products
    if (searchText.isEmpty) {
      setState(() {
        filteredProducts.addAll(state.productsList);
      });
    } else {
      // Filter products whose title contains the search text
      setState(() {
        filteredProducts.addAll(state.productsList.where((product) =>
            product.title!.toLowerCase().contains(searchText.toLowerCase())));
      });
    }
  }
}
