import 'package:flutter/material.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/grid_view_product.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/brand_container.dart';

class TCategoryTabView extends StatelessWidget {
  const TCategoryTabView({
    super.key,
    required this.logo,
    required this.name,
    required this.id,
  });

  final logo;
  final name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                BrandContainer(
                  id: '',
                  brandLogo: logo,
                  brandName: name,
                  image:
                      "https://firebasestorage.googleapis.com/v0/b/flutter-e-commerce-app-51ccb.appspot.com/o/VariationImage%2F1711943149593304?alt=media&token=a78f7c49-ecad-49da-8c81-8cb9b0c92ea4",
                  height: 220,
                  isAvailable: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'You might like',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('View all'))
                  ],
                ),
                const TGridViewProduct(
                  mainAxisExnt: 270,
                )
              ],
            ),
          ),
        ]);
  }
}
