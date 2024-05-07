import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/store/brands/brandProducts/brand_products.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    super.key,
    required this.height,
    this.image,
    required this.isAvailable,
    required this.brandLogo,
    required this.brandName,
    required this.id,
  });

  final double height;
  final image;
  final brandLogo;
  final brandName;
  final bool isAvailable;
  final String id;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrandProducts(
                id: id, brandLogo: brandLogo, brandName: brandName),
          ),
        );
      },
      child: Container(
        height: height,
        decoration: dark
            ? BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15),
              )
            : BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                          child: CachedNetworkImage(
                        imageUrl: brandLogo,
                        fit: BoxFit.cover,
                      ))),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    brandName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 18,
                  )
                ],
              ),
              isAvailable
                  ? Row(
                      children: List.generate(
                        image.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 130,
                            width: 109,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TRoundedImage(
                              imageUrl: image[index],
                              isNetworkImage: true,
                              width: 109,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
