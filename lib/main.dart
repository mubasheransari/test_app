import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/splash_screen.dart';
import 'Features/catgories/bloc/categories_bloc.dart';
import 'Features/catgories/bloc/categories_event.dart';
import 'Features/catgories/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlocProvider<CategoriesBloc>(
      lazy: false,
      create: (context) {
        final categoriesBloc = CategoriesBloc();
        categoriesBloc.add(GetProducts());
        categoriesBloc.add(GetCategories());
        categoriesBloc.add(GetCategoriesBeauty());
        return categoriesBloc;
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
