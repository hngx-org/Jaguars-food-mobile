import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26.0, 50.0, 26.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
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
              height: 20.0,
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
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.alarm),
                    ),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Free lunch',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                              height: 0.14,
                              letterSpacing: -0.14,
                            ),
                          ),
                          TextSpan(
                            text: ' from ',
                            style: TextStyle(
                              color: Color(0xFF55506D),
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              height: 0.14,
                              letterSpacing: -0.14,
                            ),
                          ),
                          TextSpan(
                            text: 'Shola Peters',
                            style: TextStyle(
                              color: Color(0xFF1B1A21),
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              height: 0.14,
                              letterSpacing: -0.14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      '15 Sep, 12:48',
                      style: TextStyle(
                        color: Color(0xFFABABAB),
                        fontSize: 12,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        height: 0.19,
                        letterSpacing: -0.12,
                      ),
                    ),
                    trailing: Text(
                      'Redeem',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF2EAA60),
                        fontSize: 12,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        height: 0.19,
                        letterSpacing: -0.12,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
