import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final String header;
  final String body;
  final String buttonText;

  CustomDialog({
    required this.header,
    required this.body,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(header, style: TextStyle(color: Colors.red, fontSize: 23, fontWeight: FontWeight.w800),),
      content: SingleChildScrollView(
        child: Text(body, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
            elevation: MaterialStatePropertyAll(3),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                  (states) => RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          child: Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w800),),
        ),
        10.horizontalSpace
      ],
      elevation: 3,
      backgroundColor: Colors.black.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0), // Customize the border radius as needed
      ),
    );
  }
}

Future<void> showCustomDialog({
  required BuildContext context,
  required String header,
  required String body,
  required String buttonText,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        header: header,
        body: body,
        buttonText: buttonText,
      );
    },
  );
}
