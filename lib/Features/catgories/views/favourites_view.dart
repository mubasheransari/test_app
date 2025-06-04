import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_event.dart';
import 'package:test_app/Features/catgories/views/product_details_view.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/product_card.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_state.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Favourites",
          fontFamily: 'playfair',
          fontWeight: FontWeight.w600,
          textSize: 24,
        ),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state.favouriteProducts.isEmpty) {
            return const Center(child: Text('No favourites yet'));
          }

          return ListView.builder(
            itemCount: state.favouriteProducts!.length,
            itemBuilder: (context, index) {
              final product = state.favouriteProducts![index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(
                        id: product.id,
                        title: product.title,
                        mainImage: product.thumbnail,
                        price: product.price!.toDouble(),
                        category: product.category.toString(),
                        brand: product.brand.toString(),
                        rating: product.rating!.toDouble(),
                        stock: product.stock!.toInt(),
                        description: product.description,
                      ),
                    ),
                  );
                  context
                      .read<CategoriesBloc>()
                      .add(GetProductsImageDetails(id: product.id));
                },
                child: ProductCard(
                  imagePath: product.thumbnail,
                  title: product.title,
                  rating: product.rating!.toDouble(),
                  price: product.price!.toDouble(),
                  brand: product.brand.toString(),
                  category: product.category.toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

