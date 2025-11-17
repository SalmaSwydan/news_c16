import 'package:flutter/material.dart';
import 'package:news_c16/core/resources/widgets/custom_scaffold.dart';
import 'package:news_c16/data/models/category_model.dart';
import 'package:news_c16/presentaion/category_screen/category_view.dart';
import '../category_details/category_details_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onHomeClick,
      title: categoryModel == null ?'Home' : categoryModel?.title ??"",
        actions: categoryModel == null ? null : [
          IconButton(onPressed: () {
            // todo navigate to search screen
          }, icon: Icon(Icons.search))
        ],
      body: categoryModel == null ? CategoryView(onCategoryClick) :CategoryDetailsView(
        categoryModel!
      )
    );
  }

  void onCategoryClick(CategoryModel category){
    setState(() {
      categoryModel = category;
    });
  }
  void onHomeClick(){
    setState(() {
      categoryModel = null;
    });
  }
}
