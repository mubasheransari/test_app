import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_event.dart';
import 'package:test_app/Features/catgories/bloc/categories_state.dart';
import 'package:test_app/Models/ProductsModel/products_model.dart';
import 'package:test_app/widgets/custom_text.dart';

class ProductDetailsPage extends StatelessWidget {
  final int id;
  final String title;
  final String mainImage;
  final double price;
  final String category;
  final String brand;
  final double rating;
  final int stock;
  final String description;

  ProductDetailsPage({
    super.key,
    required this.id,
    required this.title,
    required this.mainImage,
    required this.price,
    required this.category,
    required this.brand,
    required this.rating,
    required this.stock,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: "Product Detail",
          fontFamily: 'playfair',
          fontWeight: FontWeight.w600,
          textSize: 24,
        ),
        centerTitle: true,
        leading: const BackButton(),
        actions: [
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              final isFavourite = (state.favouriteProducts ?? [])
                  .any((element) => element.id == id);

              return IconButton(
                icon: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  final product = ProductModel(
                    images: [],
                    reviews: [],
                    dimensions: null,
                    discountPercentage: 0,
                    id: id,
                    title: title,
                    price: price,
                    category: category,
                    brand: brand,
                    description: description,
                    stock: stock,
                    rating: rating,
                    thumbnail: mainImage,
                  );
                  if (isFavourite) {
                    context
                        .read<CategoriesBloc>()
                        .add(RemoveFromFavourites(productId: id));
                  } else {
                    context
                        .read<CategoriesBloc>()
                        .add(AddToFavourites(product: product));
                  }
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                mainImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const CustomTextWidget(
              text: 'Product Details:',
              fontWeight: FontWeight.bold,
              textSize: 18,
            ),
            _buildDetailRow('Name', title),
            _buildDetailRow('Price', '\$${price.toStringAsFixed(0)}'),
            _buildDetailRow('Category', category),
            _buildDetailRow('Brand', brand),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: 'Rating : ',
                  fontWeight: FontWeight.bold,
                ),
                // const Text('Rating : ',
                //     style: TextStyle(fontWeight: FontWeight.bold)),
                CustomTextWidget(
                  text: rating.toStringAsFixed(1),
                ),
                const SizedBox(width: 6),
                ...List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    size: 16,
                    color: index < rating.round()
                        ? Colors.amber
                        : Colors.grey.shade300,
                  );
                }),
              ],
            ),
            _buildDetailRow('Stock', stock.toString()),
            const SizedBox(height: 16),
            const CustomTextWidget(
              text: 'Description :',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 4),
            CustomTextWidget(
              text: description,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(height: 16),
            const CustomTextWidget(
              text: 'Product Gallery :',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),
            BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
              return state.productDetailsEnum == ProductDetailsEnum.loaded
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.productImagesModel!.images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            state.productImagesModel!.images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CustomTextWidget(
            text: '$label : ',
            fontWeight: FontWeight.bold,
          ),
          Flexible(
            child: CustomTextWidget(
              text: value,
            ),
          ),
        ],
      ),
    );
  }
}
