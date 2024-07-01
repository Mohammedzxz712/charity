import 'package:charity/ui/user/features/categories/logic/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custome_app_bar.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../components/category_item.dart';
import '../components/header_of_screen.dart';
import '../data/model/category_item_model.dart';

class OrganizationMethod extends StatelessWidget {
  final int organizationId;
  const OrganizationMethod({Key? key, required this.organizationId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit()..getOrganizationCategories(organizationId),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OrganizationCategoriesLoading) {
            return const Scaffold(
              body: Center(
                child: CustomLoadingIndicator(),
              ),
            );
          } else if (state is CategoriesSuccessState) {
            final categoriesList =
                context.read<CategoriesCubit>().categoriesList;

            if (categoriesList == null) {
              return const Scaffold(
                body: Center(
                  child: CustomLoadingIndicator(),
                ),
              );
            }
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
                          itemCount: categoriesList?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  context
                                      .read<CategoriesCubit>()
                                      .handleCategory(context, index);
                                },
                                child: CategoryItem(
                                  categoryItemModel: CategoryItemModel(
                                      image:
                                          'https://charityorg.life/storage/app/public/assets/uploads/Category/${categoriesList?[index].image}',
                                      txt: '${categoriesList?[index].name}'),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is OrganizationCategoriesError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return Center(
              child: Text('Error: '),
            );
          }
        },
      ),
    );
  }
}
