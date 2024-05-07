
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/store/brand_bloc/brand_bloc.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/store/brands/brandProducts/brand_products.dart';

class BrandsGridView extends StatelessWidget {
  const BrandsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: state.brands!.length,
          shrinkWrap: true,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 4),
          itemBuilder: (context, index) {
            final brands = state.brands![index];
            return GestureDetector(
              onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BrandProducts(id: brands.id, brandLogo: brands.image, brandName: brands.name),));
      },
              child: Container(
                decoration: dark
                ? 
                BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                )
                :
                BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 100,
                width: 80,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: Image.network(brands.image,
                            fit: BoxFit.contain),
                      ),
                      dark
                      ?
                      Text(brands.name)
                      : 
                      Text(brands.name,  style: TextStyle(
                        color: Colors.black
                      ),)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
