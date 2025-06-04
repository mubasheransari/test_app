import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_state.dart';
import 'package:test_app/widgets/custom_text.dart';
import '../../../widgets/search_widget.dart';
import '../bloc/categories_event.dart';
import 'category_beauty_view.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    print("Search Query: $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomTextWidget(
        text: "Categories",
        fontFamily: 'playfair',
        fontWeight: FontWeight.w600,
        textSize: 24,
      )),
      body: Column(
        children: [
          SearchWidget(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
          Expanded(child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
              ),
              itemCount: state.categoryModel!.length,
              itemBuilder: (context, index) {
                List<String> imageUrls = [
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiGbixcyBsq_epYWIP8tt2A2OAYS62MkhV6A&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTutZm1WGmd8M54snkk3p74GZCZvkv7hBI6QA&s',
                ];
                return MyContainerWithBackground(
                  name: state.categoryModel![index].name.toString(),
                  image: imageUrls[index],
                );
              },
            );
          })),
        ],
      ),
    );
  }
}

class MyContainerWithBackground extends StatelessWidget {
  final String name;
  final String image;

  const MyContainerWithBackground(
      {Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image.toString()),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
