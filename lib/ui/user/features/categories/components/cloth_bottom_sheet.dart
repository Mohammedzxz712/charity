import 'package:charity/core/api/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:charity/ui/user/features/categories/logic/categories_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClotheDonationBottomSheet extends StatefulWidget {
  const ClotheDonationBottomSheet({Key? key}) : super(key: key);

  @override
  _ClotheDonationBottomSheetState createState() =>
      _ClotheDonationBottomSheetState();
}

class _ClotheDonationBottomSheetState extends State<ClotheDonationBottomSheet>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String _selectedGender = 'male';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _detailsController.dispose();
    _quantityController.dispose();
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

  String _mapGenderToValue(String gender) {
    return gender == 'male' ? 'male' : 'female';
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
                                  .clothingdonationsuccess,
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
                                  .clothingdonationsuccess,
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
          }
        },
        builder: (context, state) {
          return Container(
            height: isKeyboardVisible
                ? screenHeight * 0.8
                : screenHeight *
                    0.5, // Adjust height based on keyboard visibility
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(22),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.clothingdonationdetails,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: fieldWidth,
                      child: TextFormField(
                        controller: _detailsController,
                        style: const TextStyle(height: .9),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.details,
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseenterdetails;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: fieldWidth,
                      child: TextFormField(
                        controller: _quantityController,
                        style: const TextStyle(height: .9),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .numberofclothingitems,
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseenternumberofclothingitems;
                          }
                          if (int.tryParse(value) == null) {
                            return AppLocalizations.of(context)!
                                .pleaseenteravalidnumber;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: fieldWidth,
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        items: const [
                          DropdownMenuItem(value: 'male', child: Text('ذكر')),
                          DropdownMenuItem(
                              value: 'female', child: Text('انثي')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.type,
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<CategoriesCubit>().submitFood(
                                  user_id: ApiConstant.id ??
                                      0, // Replace with actual user ID
                                  organization_id:
                                      3, // Replace with actual organization ID
                                  category_id:
                                      61, // Replace with actual category ID
                                  donation_type: 'clothes',
                                  description: _detailsController.text,
                                  amount: _quantityController.text,
                                  gender: _mapGenderToValue(_selectedGender),
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
      ),
    );
  }
}
