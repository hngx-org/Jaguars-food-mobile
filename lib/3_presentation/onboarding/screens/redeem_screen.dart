import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26.0, 107.0, 26.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Redeem your rewards',
              style: TextStyle(
                color: AppColor.black,
                fontSize: 24,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0.06,
                letterSpacing: -0.24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 57,
                width: 320,
                padding: const EdgeInsets.fromLTRB(12, 16, 13, 13),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppColor.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    hintText: 'Search for reward, employee',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 74.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All rewards',
                  style: TextStyle(
                    color: Color(0xFF55506D),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                    letterSpacing: -0.18,
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xFFABABAB),
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      height: 0.14,
                      letterSpacing: -0.14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
