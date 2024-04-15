import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/banners_bloc/banners_bloc_bloc.dart';
import 'package:shop_vista/application/home/page_indicator/bloc/page_indicator_bloc.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/banner_shimmer.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/banner_widgets.dart';

class TMainBannerContainer extends StatelessWidget {
  const TMainBannerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BannersBlocBloc>(context).add(const GetBannersImage());
    return BlocBuilder<PageIndicatorBloc, PageIndicatorState>(
      builder: (context, state) {
        return BlocBuilder<BannersBlocBloc, BannersState>(
          builder: (ctx, bannerState) {
            return bannerState.isLoading || bannerState.banners == null
                ? BannerShimmer().buildShimmer()
                : CarouselSlider.builder(
                    itemCount: bannerState.banners!.length,
                    itemBuilder: (context, index, realIndex) {
                      final bannerImage = bannerState.banners![index];
                      return TBannerWidget(
                        imageUrl: bannerImage.imageUrl,
                      );
                    },
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        state.page = index;
                        BlocProvider.of<PageIndicatorBloc>(context)
                            .add(PageIndicatorEvent());
                      },
                      autoPlay: true,
                      viewportFraction: 0.8,
                    ),
                  );
          },
        );
      },
    );
  }
}
