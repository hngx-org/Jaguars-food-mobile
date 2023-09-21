import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool button1 = true;
  bool button2 = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Welcome to AppreciAte',
          style: GoogleFonts.lato(
            color: const Color(0xFF571FCD),
            fontSize: 29,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Gift employees and co-workers',
          style: GoogleFonts.lato(
            color: const Color(0xFF98A1B2),
            fontSize: 18.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: height * 0.075,
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/png/people.png'),
        ),
        SizedBox(
          height: height * 0.125,
        ),
        FancyButton(
            isButton2: false,
            text: 'Create your organisation',
            isPressed: button1,
            onTapped: () {
              if (button1 == false) {
                setState(() {
                  button1 = true;
                  button2 = false;
                });
              }
            }),
        FancyButton(
          isButton2: true,
          text: 'Join an existing organization',
          isPressed: button2,
          onTapped: () {
            if (button2 == false) {
              setState(() {
                button2 = true;
                button1 = false;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Sign into your organization',
            style: GoogleFonts.lato(
              color: AppColor.appBrandColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    ));
  }
}

class FancyButton extends StatelessWidget {
  final String text;
  final bool isPressed;
  final VoidCallback onTapped;
  final bool isButton2;
  const FancyButton(
      {super.key,
      required this.text,
      required this.isPressed,
      required this.onTapped,
      required this.isButton2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
              color: isPressed ? AppColor.appBrandColor : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: isButton2
                  ? Border.all(width: 1.75, color: Colors.deepPurpleAccent)
                  : null
              //border: BoxShadow()
              ),
          child: Center(
            child: Text(
              text,
              style:
                  TextStyle(color: isPressed ? Colors.white : AppColor.black),
            ),
          ),
        ),
      ),
    );
  }
}
