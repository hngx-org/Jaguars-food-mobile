import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class ConfirmRedeemScreen extends StatelessWidget {
  const ConfirmRedeemScreen({super.key});

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
                    'You will receive\nRewards in cash value',
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
                  onPressed: () {},
                  buttonText: 'Send',
                  fontSize: 14,
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
}
