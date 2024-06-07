import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/style/styles.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../components/name_phone_loc.dart';
import '../logic/ediet_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EdietCubit, EdietState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<EdietCubit>();
        var model = cubit.GetProfileModel;
        if (state is GetSuccessState && cubit.GetProfileModel != null) {
          cubit.nameController.text = model!.name!;
          cubit.locationController.text = model!.location!;
          cubit.phoneController.text = model!.phone!;
          cubit.emailController.text = model!.email!;
        }

        return ConditionalBuilder(
          condition:
              state is GetSuccessState && cubit.GetProfileModel != null ||
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
                'Edit Profile',
                style: TextStyles.font17WhiteMedium,
              ),
              titleSpacing: 3,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
