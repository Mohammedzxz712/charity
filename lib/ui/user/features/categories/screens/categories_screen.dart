import 'package:charity/ui/user/features/categories/logic/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/category_item.dart';
import '../components/header_of_screen.dart';
import '../data/model/category_item_model.dart';

class OrganizationMethod extends StatelessWidget {
  const OrganizationMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Header(),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two containers per row
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount:
                          context.read<CategoriesCubit>().methodName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              context
                                  .read<CategoriesCubit>()
                                  .handleCategory(context, index);
                            },
                            child: CategoryItem(
                              categoryItemModel: CategoryItemModel(
                                  image: context
                                      .read<CategoriesCubit>()
                                      .methodImage[index],
                                  txt: context
                                      .read<CategoriesCubit>()
                                      .methodName[index]),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
