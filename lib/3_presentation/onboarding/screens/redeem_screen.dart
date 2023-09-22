import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Redeem your rewards',
                style: GoogleFonts.lato(
                  color: AppColor.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: AppColor.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
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
                    return ListTile(
                      leading: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/png/lunch.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Free lunch',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 21, 21, 21),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: ' from ',
                              style: GoogleFonts.lato(
                                color: const Color(0xFF55506D),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Shola Peters',
                              style: GoogleFonts.lato(
                                color: const Color(0xFF1B1A21),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        '15 Sep, 12:48',
                        style: GoogleFonts.lato(
                          color: const Color(0xFFABABAB),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          context.push(RoutesPath.withdrawDetailsScreen);
                        },
                        child: Text(
                          'Redeem',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                            color: const Color(0xFF2EAA60),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
