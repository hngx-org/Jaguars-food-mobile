import 'package:flutter/material.dart';

class Redeem extends StatelessWidget {
  const Redeem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(26.0, 107.0, 26.0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Redeem your rewards',
            style: TextStyle(
              color: Color(0xFF33313E),
              fontSize: 24,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              height: 0.06,
              letterSpacing: -0.24,
            ),
          ),
        ],
      ),
    );
  }
}
