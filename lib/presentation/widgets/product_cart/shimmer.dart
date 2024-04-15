import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';

class ShimmerProduct {
  buildShimmerEffect() {
    return GridView.builder(
      itemCount: 6, // Adjust the number of shimmer items as needed
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 265,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }

  buildShimmerEffectBrand() {
    return ListView.separated(
      separatorBuilder: (context, index) => kHeight,
      itemCount: 6, // Adjust the number of shimmer items as needed
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      },
    );
  }
}
