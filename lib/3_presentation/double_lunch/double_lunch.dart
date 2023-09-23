import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';

class DoubleLunch extends StatefulWidget {
  final String lunchType;
  final String? giftee;
  const DoubleLunch({
    super.key,
    required this.lunchType,
    this.giftee,
  });

  @override
  State<DoubleLunch> createState() => _DoubleLunchState();
}

class _DoubleLunchState extends State<DoubleLunch> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 40),
                child: Text(
                  "You’re gifting ${widget.giftee}!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
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

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: TextField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // send button
              SizedBox(
                height: 52,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RoutesPath.successScreen, extra: {
                      "giftee": "Adekunle Emmanuel",
                      "lunch": widget.lunchType,
                    });
                  },
                  child: Text(
                    'Send',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
