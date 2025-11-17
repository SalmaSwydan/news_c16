import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_c16/data/models/category_model.dart';
import 'package:provider/provider.dart';

import 'NewsSources.dart';
import 'category_details_viewModel.dart';

class CategoryDetailsView extends StatelessWidget {
  CategoryModel category;

  CategoryDetailsView(this.category, {super.key}) {
    vm.getNewsSources(category.id ?? "");
  }

  CategoryDetailsViewModel vm = CategoryDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Scaffold(
        body: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
            var screenState = viewModel.state;
            switch (screenState.state) {
              case ScreenState.Initial:
              case ScreenState.Loading:
                {
                  return Center(child: CircularProgressIndicator());
                }
              case ScreenState.Error:
                {
                  return Center(
                    child: Text(
                      screenState.errorMessage ?? "Something Went Wrong",
                    ),
                  );
                }
              case ScreenState.Success:
                {
                  return NewsSourcesWidget(screenState.sources ?? []);
                }
            }
          },
        ),
      ),
    );
  }
}
