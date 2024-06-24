import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/style/styles.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../components/name_phone_loc.dart';
import '../logic/ediet_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EdietCubit, EdietState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<EdietCubit>();

        if (state is GetSuccessState && cubit.GetProfileModel != null) {
          cubit.nameController.text = cubit.GetProfileModel!.name!;
          cubit.locationController.text = cubit.GetProfileModel!.location!;
          cubit.phoneController.text = cubit.GetProfileModel!.phone!;
          cubit.emailController.text = cubit.GetProfileModel!.email!;
        }

        return ConditionalBuilder(
          condition: state is GetSuccessState && cubit.GetProfileModel != null ||
              state is CameraSuccessState ||
              state is UpdateUserDataSuccessState,
          fallback: (context) => const Center(child: CustomLoadingIndicator()),
          builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.editprofile,
                style: TextStyles.font17WhiteMedium,
              ),
              titleSpacing: 3,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Form(
                key: cubit.formKey,
                child: NameAndPhoneAndLocation(cubit: cubit),
              ),
            ),
          ),
        );
      },
    );
  }
}
