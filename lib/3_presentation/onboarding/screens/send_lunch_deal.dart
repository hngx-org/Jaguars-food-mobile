import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';

class SendLunchDealScreen extends StatefulWidget {
  const SendLunchDealScreen({Key? key}) : super(key: key);

  @override
  State<SendLunchDealScreen> createState() => _SendLunchState();
}

class _SendLunchState extends State<SendLunchDealScreen> {
  String selectedDeal = 'Single';

  // Function to build custom Circular Checkbox
  Widget buildCustomCheckbox({
    required String title,
    required String subtitle,
    required String value,
  }) {
    final isSelected = selectedDeal == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedDeal = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: isSelected ? Colors.deepPurple : Colors.black26,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 25.0,
              height: 50.0,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColor.appBrandColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColor.border : Colors.black26,
                  width: 2.0,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: 20.0,
                color: AppColor.white,
              )
                  : null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  GoogleFonts.lato(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitle,
                  style:
                  GoogleFonts.lato(
                    color: AppColor.subText,
                    fontSize: 12,
                  ),
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
              top: 50.0, left: 10.0, right: 10.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gift Adekunle Emmanuel',
                style: GoogleFonts.lato(
                  color: AppColor.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                'Select lunch offer!',
                style:
                GoogleFonts.lato(
                  color: AppColor.subText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30.0,),
              Text(
                'Send a Lunch deal!',
                style:
                GoogleFonts.lato(
                  color: AppColor.appBrandColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              buildCustomCheckbox(
                title: 'Single',
                subtitle: 'You can give a single lunch',
                value: 'Single',
              ),
              const SizedBox(
                height: 10.0,
              ),
              buildCustomCheckbox(
                title: 'Double',
                subtitle: 'You can give a double lunch',
                value: 'Double',
              ),
              const SizedBox(
                height: 10.0,
              ),
              buildCustomCheckbox(
                title: 'Triple',
                subtitle: 'You can give a triple lunch',
                value: 'Triple',
              ),
              const SizedBox(
                height: 10.0,
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
                  child:
                  ButtonWidget(
                    onPressed: () {

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