import 'package:charity/core/api/api_constant.dart';
import 'package:charity/ui/user/features/categories/logic/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BloodDonationBottomSheet extends StatefulWidget {
  const BloodDonationBottomSheet({super.key});

  @override
  _BloodDonationBottomSheetState createState() =>
      _BloodDonationBottomSheetState();
}

class _BloodDonationBottomSheetState extends State<BloodDonationBottomSheet>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _additionalDetailsController =
      TextEditingController();
  String _donatedBeforeThreeMonths = 'no';
  String _bloodType = 'A+';
  final TextEditingController _diseasesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _additionalDetailsController.dispose();
    _diseasesController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }

  int _mapDonatedBeforeThreeMonthsToValue(String value) {
    return value == 'yes' ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fieldWidth =
        screenWidth * 0.8; // Set field width to 80% of screen width

    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesSuccessState) {
            // Show success dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 66,
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: const Offset(0.0, 10.0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.operationSuccessful,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 24),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 80,
                            ),
                            SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!
                                  .blooddonationsuccess,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.ok,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 16,
                        right: 16,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 40,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is OrganizationCategoriesError) {
            // Show error dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 66,
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: const Offset(0.0, 10.0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'عملية ناجحة',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 24),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 80,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'تم تقديم تفاصيل التبرع بالدم بنجاح.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'موافق',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 16,
                        right: 16,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 40,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isKeyboardVisible
                    ? screenHeight * 0.9
                    : screenHeight *
                        0.6, // Adjust height based on keyboard visibility
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(22),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.blooddonationdetails,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: fieldWidth,
                          child: DropdownButtonFormField<String>(
                            value: _bloodType,
                            items: const [
                              DropdownMenuItem(value: 'A+', child: Text('A+')),
                              DropdownMenuItem(value: 'A-', child: Text('A-')),
                              DropdownMenuItem(value: 'B+', child: Text('B+')),
                              DropdownMenuItem(value: 'B-', child: Text('B-')),
                              DropdownMenuItem(
                                  value: 'AB+', child: Text('AB+')),
                              DropdownMenuItem(
                                  value: 'AB-', child: Text('AB-')),
                              DropdownMenuItem(value: 'O+', child: Text('O+')),
                              DropdownMenuItem(value: 'O-', child: Text('O-')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _bloodType = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context)!.bloodtype,
                              labelStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseselectabloodtype;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 13),
                        SizedBox(
                          width: fieldWidth,
                          child: TextFormField(
                            controller: _diseasesController,
                            style: const TextStyle(height: .9),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!
                                  .doyouhaveanydiseases,
                              labelStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .doyouhaveanydiseases;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 13),
                        SizedBox(
                          width: fieldWidth,
                          child: DropdownButtonFormField<String>(
                            value: _donatedBeforeThreeMonths,
                            items: const [
                              DropdownMenuItem(
                                  value: 'yes', child: Text('Yes')),
                              DropdownMenuItem(value: 'no', child: Text('No')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _donatedBeforeThreeMonths = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!
                                  .haveyoudonatedbloodbeforethreemonths,
                              labelStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseselectanoption;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: state is OrganizationCategoriesLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<CategoriesCubit>()
                                          .submitFood(
                                            user_id: ApiConstant.id ?? 0,
                                            organization_id: 7,
                                            category_id: 60,
                                            donation_type: 'blood',
                                            any_diseases_else:
                                                _diseasesController.text,
                                            are_you_donate_before_three_month:
                                                _mapDonatedBeforeThreeMonthsToValue(
                                                    _donatedBeforeThreeMonths),
                                            blood_type: _bloodType,
                                            description:
                                                _additionalDetailsController
                                                    .text,
                                          );
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff1DD56C),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.send,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
