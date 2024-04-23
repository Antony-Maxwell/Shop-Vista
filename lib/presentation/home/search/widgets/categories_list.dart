
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/categories/bloc/categories_bloc.dart';
import 'package:shop_vista/presentation/home/categories/category_screen.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if(state is CategoryLoaded){
          return ListView.builder(
          itemCount: state.Categories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final cat = state.Categories[index];
            return ListTile(
               onTap: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                            parentId: state.Categories[index].parentId,
                            imageUrl: state.Categories[index].image,
                              categoryName: state.Categories[index].name),
                        ));
                    },
              title: Text(cat.name),
            );
          },
        );
        }
        return Container();
      },
    );
  }
}
