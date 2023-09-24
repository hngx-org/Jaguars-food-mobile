import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class DoubleLunch extends StatefulWidget {
  final String lunchType;
  final String? giftee;
  final String token;
  final String gifteeId;
  const DoubleLunch({
    super.key,
    required this.lunchType,
    this.giftee,
    required this.token,
    required this.gifteeId,
  });

  @override
  State<DoubleLunch> createState() => _DoubleLunchState();
}

class _DoubleLunchState extends State<DoubleLunch> {
  final TextEditingController _note = TextEditingController();
  late int _quantity;

  @override
  void initState() {
    super.initState();

    if (widget.lunchType == 'Single') {
      setState(() {
        _quantity = 1;
      });
    } else if (widget.lunchType == 'Double') {
      setState(() {
        _quantity = 2;
      });
    } else if (widget.lunchType == 'Triple') {
      setState(() {
        _quantity = 3;
      });
    } else {
      setState(() {
        _quantity = 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconWidget(),
                // text
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "You’re gifting ${widget.giftee}!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ),

                // container with png
                // text
                Padding(
                  padding: const EdgeInsets.only(top: 33, bottom: 24),
                  child: Align(
                    child: Text(
                      "${widget.lunchType} Lunch",
                      style: GoogleFonts.lato(
                          fontSize: 24.sp,
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.imageBackground,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Image.asset(
                    Assets.lunchImagePath,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Text(
                    "Add remark",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: TextField(
                    controller: _note,
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFFD9D9D9),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFFD9D9D9),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.appBrandColor,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                // send button
                ButtonWidget(
                  onPressed: () async {
                    CustomDialog().showLoadDialog(context);
                    final response = await Lunch.sendLunch(
                      [int.parse(widget.gifteeId)],
                      _quantity,
                      _note.text.isEmpty
                          ? 'From ${widget.giftee}'
                          : _note.text.trim(),
                      widget.token,
                    );

                    if (response.toString().contains('error') ||
                        response.toString().contains('fail')) {
                      routerConfig.pop();
                      _showDialog(
                        'error',
                        'Error',
                        response['message'],
                        'Ok',
                      );
                    } else {
                      routerConfig.push(RoutesPath.successScreen, extra: {
                        "giftee": widget.giftee,
                        "lunch": widget.lunchType,
                        "token": widget.token,
                      });
                    }
                  },
                  buttonText: 'Send',
                  fontSize: 16.w,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog(
    String type,
    String title,
    String body,
    String buttonText,
  ) {
    if (mounted) {
      CustomDialog().showAlertDialog(
        context,
        type,
        title,
        body,
        buttonText,
      );
    }
  }
}
