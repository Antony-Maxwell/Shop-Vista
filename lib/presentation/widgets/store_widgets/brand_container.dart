import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BrandProducts(id: id, brandLogo: brandLogo, brandName: brandName),));
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 5,),
                Image.network(
                  brandLogo,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5,),
                Text(
                  brandName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(width: 4,),
                const Icon(Icons.verified, color: Colors.blue, size: 18,)
              ],
            ),
            isAvailable
                ? Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                            child: TRoundedImage(
                              imageUrl: image,
                              isNetworkImage: true,
                              width: 110,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                            child: TRoundedImage(
                              imageUrl: image,
                              isNetworkImage: true,
                              width: 100,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                            child: TRoundedImage(
                              imageUrl: image,
                              isNetworkImage: true,
                              width: 110,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
