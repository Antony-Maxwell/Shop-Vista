import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/store/brand_bloc/brand_bloc.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/featured_brand_container.dart';

class ViewAllBrands extends StatelessWidget {
  const ViewAllBrands({
    required this.id,
    super.key});

  final List<BrandModel> id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Brands',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 10),
                          FeraturedBrands(
                            id: id,
                            brandLogo: state.brands!,
                            brandName: state.brands!,
                            count: state.brands!.length,
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
