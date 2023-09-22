import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String headerText;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final BorderSide? borderSide;

  const CustomTextField({
    super.key,
    required this.headerText,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          headerText,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            hintStyle: const TextStyle(color: AppColor.hinttextfieldColor),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: borderSide ?? BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: borderSide ?? BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldWithDropdown extends StatefulWidget {
  final String headerText;
  final String hintText;
  final List<String> dropdownItems;
  final ValueChanged<String> onChanged;

  CustomTextFieldWithDropdown({
    required this.headerText,
    required this.hintText,
    required this.dropdownItems,
    required this.onChanged,
  });

  @override
  _CustomTextFieldWithDropdownState createState() =>
      _CustomTextFieldWithDropdownState();
}

class _CustomTextFieldWithDropdownState
    extends State<CustomTextFieldWithDropdown> {
  String selectedDropdownValue = "";
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    selectedDropdownValue = widget.dropdownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          readOnly: true, // Prevent manual editing
          controller: TextEditingController(
            text: selectedDropdownValue,
          ),
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: AppColor.appBrandColor)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: AppColor.appBrandColor)
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownOpen = !isDropdownOpen;
                });
              },
              child: Icon(
                isDropdownOpen
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,
              ),
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.dropdownItems
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedDropdownValue = item;
                          isDropdownOpen = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(item),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
