import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';

class SendLunchDealScreen extends StatefulWidget {
  final String giftee;
  final String token;
  final String gifteeId;
  const SendLunchDealScreen({
    Key? key,
    required this.giftee,
    required this.token,
    required this.gifteeId,
  }) : super(key: key);

  @override
  State<SendLunchDealScreen> createState() => _SendLunchState();
}

class _SendLunchState extends State<SendLunchDealScreen> {
  String selectedDeal = '';
  bool isLunchDealSelected = false; // Track whether a lunch deal is selected
  String selectMessage1 = 'Select lunch offer!';
  String selectMessage2 = 'You can choose to gift multiple items';

  // Function to build custom Circular Checkbox
  Widget buildCustomCheckbox({
    required String title,
    required String subtitle,
    required String value,
  }) {
    bool isSelected =
        selectedDeal == value; // Move isSelected inside this function

    return InkWell(
      onTap: () {
        setState(() {
          selectedDeal = value;
          isLunchDealSelected = true; // Lunch deal is selected
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: isSelected ? Colors.deepPurple : const Color(0xFFD9D9D9),
            width: 1.0.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20.0.w,
              height: 20.0.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColor.appBrandColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColor.border : Colors.black26,
                  width: 1.w,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 14.sp,
                      color: AppColor.white,
                    )
                  : null,
            ),
            SizedBox(
              width: 30.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: const Color(0xFF55506D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.lato(
                      color: const Color(0xFFABABAB),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconWidget(),
              Text(
                'Gift ${widget.giftee}',
                style: GoogleFonts.lato(
                  color: AppColor.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                isLunchDealSelected
                    ? selectMessage2
                    : selectMessage1, // Display the appropriate message
                style: GoogleFonts.lato(
                  color: AppColor.subText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Send Lunch deal!',
                style: GoogleFonts.lato(
                  color: AppColor.appBrandColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.0.h,
              ),
              buildCustomCheckbox(
                title: 'Single',
                subtitle: 'You can give a single lunch',
                value: 'Single',
              ),
              SizedBox(
                height: 15.0.h,
              ),
              buildCustomCheckbox(
                title: 'Double',
                subtitle: 'You can give a double lunch',
                value: 'Double',
              ),
              SizedBox(
                height: 15.0.h,
              ),
              buildCustomCheckbox(
                title: 'Triple',
                subtitle: 'You can give a triple lunch',
                value: 'Triple',
              ),
              SizedBox(
                height: 15.0.h,
              ),
              buildCustomCheckbox(
                title: 'Quadruple',
                subtitle: 'You can give a quadruple lunch',
                value: 'Quadruple',
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  child: ButtonWidget(
                    onPressed: () {
                      context.push(RoutesPath.doubleLunchScreen, extra: {
                        "giftee": widget.giftee,
                        "lunch": selectedDeal,
                        "token": widget.token,
                        "gifteeId": widget.gifteeId,
                      });
                    },
                    buttonText: 'Proceed',
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
