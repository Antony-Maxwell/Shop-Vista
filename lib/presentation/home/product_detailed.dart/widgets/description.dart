import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    this.description,
  });
  final description;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: '  Show more',
      trimExpandedText: '  Less',
      moreStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
    );
  }
}
