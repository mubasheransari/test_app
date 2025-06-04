import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/categories_bloc.dart';
import '../bloc/categories_state.dart';

class CategoryBeautyView extends StatefulWidget {
  const CategoryBeautyView({super.key});

  @override
  State<CategoryBeautyView> createState() => _CategoryBeautyViewState();
}

class _CategoryBeautyViewState extends State<CategoryBeautyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state.categoriesBeautyEnum == CategoriesBeautyEnum.loaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: state.beautyCatregoryModel!.length,
              itemBuilder: (context, index) {
                var beautyProduct = state.beautyCatregoryModel![index];
                return Text(state.categoriesBeautyEnum.toString());
                // ListView.builder(
                //     itemCount: 2,
                //     //  state.beautyCatregoryModel![index].products!.length,
                //     itemBuilder: (context, indexx) {
                //       return Text("abcd");
                //     });

                // Text(
                //   state.beautyCatregoryModel![index].products![index].price.toString(),
                // );
              },
            );
          } else if (state.categoriesBeautyEnum ==
              CategoriesBeautyEnum.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          // } else if (state.categoriesBeautyEnum == CategoriesBeautyEnum.error) {
          //   return Center(child: Text('Something went wrong'));
          // }
          else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: BlocBuilder<CategoriesBloc, CategoriesState>(
  //         builder: (context, state) {
  //       return GridView.builder(
  //         padding: const EdgeInsets.all(16.0),
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 16.0,
  //           mainAxisSpacing: 16.0,
  //         ),
  //         itemCount: state.beautyCatregoryModel!.length,
  //         itemBuilder: (context, index) {
  //           return
  //           Text(state
  //               .beautyCatregoryModel![index].products![index].brand
  //               .toString());
  //           // CategoryItem(
  //           //   image: state.categoryModel![index].url.toString(),
  //           //   name: state.categoryModel![index].name.toString(),
  //           // );
  //         },
  //       );
  //     }),
  //   );
  // }
}
