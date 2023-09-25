import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class ConfirmRedeemScreen extends StatefulWidget {
  final String token;
  final String index;
  final String lunchType;
  final String sender;
  const ConfirmRedeemScreen({
    super.key,
    required this.token,
    required this.index,
    required this.lunchType,
    required this.sender,
  });

  @override
  State<ConfirmRedeemScreen> createState() => _ConfirmRedeemScreenState();
}

class _ConfirmRedeemScreenState extends State<ConfirmRedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => routerConfig.pop(),
                      child: Icon(
                        Icons.close,
                        size: 20.w,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: SizedBox(
                  height: 1.h,
                )),
                Flexible(
                  child: Text(
                    'Are you sure you want to redeem ${widget.lunchType} from ${widget.sender}?',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.lato(
                      color: AppColor.appBrandColor,
                      fontSize: 28.w,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: AppColor.imageBackground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Image.asset(Assets.cashImagePath),
                ),
                SizedBox(
                  height: 100.h,
                ),
                ButtonWidget(
                  onPressed: () async {
                    CustomDialog().showLoadDialog(context);
                    final response =
                        await Lunch.redeemLunch(widget.token, widget.index);
                    routerConfig.pop();

                    if (response.toString().contains('error') ||
                        response.toString().contains('fail')) {
                      _showDialog(
                        'error',
                        'Error',
                        response['message'],
                        'Ok',
                      );
                    } else {
                      routerConfig
                          .pushReplacement(RoutesPath.successScreen, extra: {
                        "token": widget.token,
    "giftee":"",
                            "lunch":"",
                      });
                    }
                  },
                  buttonText: 'Confirm',
                  fontSize: 14.sp,
                ),
                Expanded(
                    child: SizedBox(
                  height: 1.h,
                )),
              ]),
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
