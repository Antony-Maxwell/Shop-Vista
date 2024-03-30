import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/page_indicator/bloc/page_indicator_bloc.dart';

class TDotsIndicator extends StatelessWidget {
  const TDotsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndicatorBloc, PageIndicatorState>(
      builder: (context, state) {
        return DotsIndicator(
          dotsCount: 3,
          position: state.page,
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.blue,
            size: Size.square(8.0),
            activeSize: Size(10.0, 8.0),
          ),
        );
      },
    );
  }
}
