import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/curved_widget.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';

class DetailedMainImage extends StatelessWidget {
  const DetailedMainImage({
    Key? key,
    required this.dark,
    required this.subImages,
    required this.mainImage,
  }) : super(key: key);

  final List<String> subImages;
  final String mainImage;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final currentMainImage = ValueNotifier<String>(mainImage);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? Colors.grey : Colors.white,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: ValueListenableBuilder<String>(
                    valueListenable: currentMainImage,
                    builder: (context, image, _) {
                      return CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final subImg = subImages[index];
                    return GestureDetector(
                      onTap: () {
                        currentMainImage.value = subImg;
                      },
                      child: TRoundedImage(
                        fit: BoxFit.contain,
                        width: 80,
                        backGroundColor: dark ? Colors.grey.shade600 : Colors.white,
                        border: Border.all(color: Colors.grey),
                        padding: const EdgeInsets.all(10),
                        imageUrl: subImg,
                        isNetworkImage: true,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: subImages.length,
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              action: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
