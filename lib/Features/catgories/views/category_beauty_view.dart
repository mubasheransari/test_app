import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/widgets/product_card.dart';
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
        return state.categoriesBeautyEnum == CategoriesBeautyEnum.loaded
            ? ListView.builder(
                itemCount: state.beautyCatregoryModel!.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imagePath: state
                        .beautyCatregoryModel!.products[index].thumbnail
                        .toString(),
                    title: state.beautyCatregoryModel!.products[index].title
                        .toString(),
                    rating: state.beautyCatregoryModel!.products[index].rating!
                        .toDouble(),
                    price: state.beautyCatregoryModel!.products[index].price!
                        .toDouble(),
                    brand: "",
                    category: state
                        .beautyCatregoryModel!.products[index].category!
                        .toString(),
                  );
                })
            : const Center(child: Text('No data found'));
      }),
    );
  }
}
