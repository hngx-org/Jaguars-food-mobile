import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/png/mcdonald.png'),
          ),
          FancyButton(
              text: 'Log In',
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
            text: 'Register',
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
          const SizedBox(
            height: 35,
          ),
        ],
      )),
    );
  }
}

class FancyButton extends StatelessWidget {
  final String text;
  final bool isPressed;
  final VoidCallback onTapped;
  const FancyButton(
      {super.key,
      required this.text,
      required this.isPressed,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: isPressed ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            //border: BoxShadow()
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: isPressed ? Colors.white : Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
