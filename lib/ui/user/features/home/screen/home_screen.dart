import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity/core/api/api_constant.dart';
import 'package:charity/core/cache/cache_helper.dart';
import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/ui/user/features/home/component/bottom_nav.dart';
import 'package:charity/ui/user/features/home/component/compine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/widgets/custome_app_bar.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../../one_organization/screens/organization_desc.dart';
import '../component/build_cat.dart';
import '../component/drawer.dart';
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
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

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
      create: (context) => HomeCubit()
        ..getHomeData()
        ..getCombine(),
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
          var campaigns = context.read<HomeCubit>().campModel?.allCampaign;

          if (organizations == null || campaigns == null) {
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
                        Container(
                          height: 170.h,
                          child: CarouselSlider.builder(
                            itemCount: campaigns.length,
                            itemBuilder:
                                (BuildContext context, int index, int realIdx) {
                              return InkWell(
                                onTap: () {
                                  // Add your navigation logic here
                                },
                                child: CombineScreen(
                                  imageAsset:
                                      'https://charityorg.life/storage/app/public/assets/uploads/Campaign/${campaigns[index].image}' ??
                                          "",
                                  title: campaigns[index].title ?? "",
                                  amount: campaigns[index].targetAmount ?? "",
                                  description:
                                      campaigns[index].description ?? "",
                                  endDate: campaigns[index].endDate ?? "",
                                ),
                              );
                            },
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayInterval: const Duration(seconds: 3),
                              height: 165.h,
                              enableInfiniteScroll: true,
                              initialPage: 0,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              viewportFraction: 1,
                            ),
                          ),
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
                    CacheHelper.removeData(key: 'id');
                    ApiConstant.token = null;
                    ApiConstant.id = null;
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
