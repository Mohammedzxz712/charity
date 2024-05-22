import 'package:charity/core/api/api_constant.dart';
import 'package:charity/core/cache/cache_helper.dart';
import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/ui/user/features/home/component/bottom_nav.dart';
import 'package:charity/ui/user/features/one_organization/logic/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/widgets/custome_app_bar.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../../../../../generated/assets.dart';
import '../../one_organization/screens/organization_desc.dart';
import '../component/build_cat.dart';
import '../component/drawer.dart';
import '../data/model/index.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CustomLoadingIndicator(),
              ),
            );
          }
        },
        builder: (context, state) {
          var organizations =
              context.read<HomeCubit>().getAllOrganizationsModel?.organizations;

          if (organizations == null) {
            return Scaffold(
              appBar: CustomMainAppBar(
                isDrawerOpen: isDrawerOpen,
                onDrawerIconTap: () {
                  setState(() {
                    isDrawerOpen = !isDrawerOpen;
                    if (isDrawerOpen) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  });
                },
              ),
              body: const Center(
                child: CustomLoadingIndicator(),
              ),
            );
          }

          return Scaffold(
            appBar: CustomMainAppBar(
              isDrawerOpen: isDrawerOpen,
              onDrawerIconTap: () {
                setState(() {
                  isDrawerOpen = !isDrawerOpen;
                  if (isDrawerOpen) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                });
              },
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'HELP OUR INSTITUTIONS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        const Gap(5),
                        const Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr Lorem ipsum \ndolor sit amet, consetetur sadipscing elitr',
                          style: TextStyle(color: Colors.grey, height: 1.2),
                        ),
                        const Gap(5),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrganizationDetailScreen(
                                  organizationId: organizations[index].id ?? 3,
                                ),
                              ),
                            ),
                            child: BuildCategory(
                              imageAsset:
                                  'https://charityorg.life/storage/app/public/assets/uploads/Organization/${organizations[index].image}' ??
                                      "",
                              title: organizations[index].name ?? "",
                              description:
                                  organizations[index].description ?? "",
                            ),
                          ),
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: organizations.length,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomDrawer(
                  isDrawerOpen: isDrawerOpen,
                  controller: _controller,
                  onHomeTap: () => _navigateAndCloseDrawer(AppRoutes.home),
                  onAboutTap: () => _navigateAndCloseDrawer(AppRoutes.about),
                  onSupportTap: () =>
                      _navigateAndCloseDrawer(AppRoutes.support),
                  onSignOutTap: () {
                    CacheHelper.removeData(key: 'token');
                    ApiConstant.token = null;
                    _navigateAndCloseDrawer(AppRoutes.login);
                  },
                ),
              ],
            ),
            bottomNavigationBar: const BottomNav(),
          );
        },
      ),
    );
  }

  void _navigateAndCloseDrawer(String routeName) {
    context.pushNamed(routeName);
    setState(() {
      isDrawerOpen = false;
      _controller.reverse();
    });
  }
}
