import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/categories/bloc/categories_bloc.dart';
import 'package:shop_vista/presentation/home/categories/category_screen.dart';
import 'package:shop_vista/presentation/widgets/vertical_categories/vertical_categories.dart';

class VerticalCategoryList extends StatelessWidget {
  const VerticalCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoriesBloc>(context).add(FetchCategories());
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if(state is CategoriesInitial){
          return const CircularProgressIndicator();
        }else if (state is CategoryLoading){
          return const CircularProgressIndicator();
        }else if(state is CategoryLoaded){
        return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.Categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = state.Categories[index];
                return TVerticalCategories(
                  ontap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(categoryName: state.Categories[index].name),)),
                  image: state.Categories[index].image,
                  title: category.name,
                  backGroundColor: Colors.white,
                );
              }),
        );
      }else if(state is CategoryError){
        return Text(state.message);
      }else{
        return Container();
      }
      },
    );
  }
}
