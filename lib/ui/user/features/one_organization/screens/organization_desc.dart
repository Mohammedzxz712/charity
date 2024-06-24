import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../../categories/screens/categories_screen.dart';

import '../logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:charity/generated/assets.dart';
import '../../../../../core/widgets/app_text_bottom.dart';
import '../components/button_nav.dart';
import '../components/info_row.dart';
import '../logic/cubit.dart';

class OrganizationDetailScreen extends StatelessWidget {
  final int organizationId;

  const OrganizationDetailScreen({Key? key, required this.organizationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrganizationCubit()..getOrganizationData(organizationId),
      child: BlocConsumer<OrganizationCubit, OrganizationState>(
        listener: (context, state) {
          if (state is OrganizationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          }
        },
        builder: (context, state) {
          if (state is OrganizationLoading) {
            return const Scaffold(
              body: Center(child: CustomLoadingIndicator()),
            );
          } else if (state is OrganizationDescSuccess) {
            final organization = context.read<OrganizationCubit>().organization;

            return Scaffold(
              bottomNavigationBar:
                  ButtonNavDonate(organizationId: organizationId),
              appBar: AppBar(
                centerTitle: true,
                title: Text(organization?.organization?.name ?? ''),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://charityorg.life/storage/app/public/assets/uploads/Organization/${organization?.organization?.image}' ??
                                '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: ColorsManager.mainColor,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 201.h,
                        width: 373.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                           Gap(8.h),
                          Text(
                            organization?.organization?.description ?? '',
                            style:  TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                           Gap(16.h),
                          InfoRow(
                            icon: Icons.phone,
                            text: organization?.organization?.phoneNumber ?? '',
                          ),
                           Gap(8.h),
                          InfoRow(
                            icon: Icons.location_on,
                            text: organization?.organization?.address ?? '',
                          ),
                           Gap(8.h),
                          InfoRow(
                            icon: Icons.email,
                            text: organization?.organization?.email ?? '',
                          ),
                           Gap(16.h),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is OrganizationError) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            // Handle other states if needed
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
