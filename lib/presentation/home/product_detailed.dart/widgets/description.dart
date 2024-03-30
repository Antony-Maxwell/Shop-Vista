import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, ''',
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
