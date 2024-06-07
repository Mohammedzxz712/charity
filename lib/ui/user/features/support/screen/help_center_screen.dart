import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/build_contact.dart';
import '../component/build_faq_screen.dart';
import '../logic/support_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Text(
                  AppLocalizations.of(context)!.makereview,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16.sp),
                ),
                Text(
                  AppLocalizations.of(context)!.contacts,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              BuildFaqScreen(),
              BuildContactUsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
