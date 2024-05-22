import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? value;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      borderRadius: BorderRadius.circular(20),
      value: value,
      onChanged: onChanged,
      items: <String>['Food', 'Blood', 'Clothes', 'WareHouse', 'Public']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
