import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/models/transactions.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:intl/intl.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Transactions> transactions;

  @override
  void initState() {
    super.initState();

    final transactionJson = [
      {
        'id': '123456',
        'senderId': 'user123',
        'receiverId': 'friend456',
        'amount': 5.0,
        'status': 'completed',
        'createdAt': '2023-09-20T12:34:56Z',
      },
      {
        'id': '123456',
        'senderId': 'user123',
        'receiverId': 'friend456',
        'amount': 5.0,
        'status': 'completed',
        'createdAt': '2023-09-20T12:34:56Z',
      },
      {
        'id': '123456',
        'senderId': 'user123',
        'receiverId': 'friend456',
        'amount': 5.0,
        'status': 'completed',
        'createdAt': '2023-09-20T12:34:56Z',
      },
      {
        'id': '123456',
        'senderId': 'user123',
        'receiverId': 'friend456',
        'amount': 5.0,
        'status': 'completed',
        'createdAt': '2023-09-20T12:34:56Z',
      }
    ];

    transactions = transactionJson.map((json) {
      return Transactions(
        receiverId: json['receiverId'] as String,
        amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
        createdAt: DateTime.parse(json['createdAt'] as String),
        id: json['id'].toString(),
        senderId: '',
        status: '',
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final currentDateTime = DateTime.now();
    String firstName = 'User';
    final formattedDate = DateFormat('d, MMMM yyyy').format(currentDateTime);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQuery.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //welcome title and profile image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: mediaQuery.width * 0.6,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome $firstName! 👋',
                            style: GoogleFonts.lato(
                              color: AppColor.black,
                              fontSize: mediaQuery.width * 0.065,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            formattedDate,
                            style: GoogleFonts.lato(
                              color: const Color(0xFFABABAB),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 49,
                      height: 49,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                      ),
                      child: Image.asset('assets/png/sample_profile.png'),
                    ),
                  ],
                ),
                //redeem , gift
                Material(
                  color: Colors.transparent,
                  child: Container(
                    width: mediaQuery.width,
                    height: 100.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF222222),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFEBEBEB)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Lunch Balance',
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '5,000',
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Convert to cash',
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 14,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 225,
                          top: -30,
                          child: SizedBox(
                            width: 137,
                            height: 84.10,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 34,
                                  top: 0,
                                  child: Container(
                                    width: 99.50,
                                    height: 84.10,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage(Assets.cheeseImagePath),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 20,
                                  child: Container(
                                    width: 137,
                                    height: 64,
                                    decoration: const BoxDecoration(
                                        color: Color(0xC9222222)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: mediaQuery.width,
                  height: 65.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //redeem

                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => setState(() {}),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE8DDFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.redeemNewPath,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Redeem',
                                    style: GoogleFonts.lato(
                                      color: const Color(0xFF571FCD),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Material(
                          child: InkWell(
                            onTap: () =>
                                routerConfig.push(RoutesPath.employeeScreen),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD3FFE5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Assets.giftBagPath),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Gift Lunch',
                                    style: GoogleFonts.lato(
                                      color: const Color(0xFF571FCD),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //received rewards
                const SizedBox(
                  height: 40,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Received Rewards',
                            style: GoogleFonts.lato(
                              color: const Color(0xFF55506D),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'See all',
                            style: GoogleFonts.lato(
                              color: const Color(0xFFABABAB),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //item
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              final formattedTransactionDate =
                                  DateFormat('d MMM, HH:mm')
                                      .format(transaction.createdAt);

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //gift icon
                                        Material(
                                          elevation: 2,
                                          color: Colors.transparent,
                                          shape: const OvalBorder(),
                                          child: Container(
                                            width: 36,
                                            height: 36,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFE8DDFF),
                                              shape: OvalBorder(),
                                            ),
                                            child: ColorFiltered(
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                AppColor.appBrandColor,
                                                BlendMode.srcIn,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/svg/gift_icon.svg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: transaction
                                                          .receiverId,
                                                      style: GoogleFonts.lato(
                                                        color: const Color(
                                                            0xFF1A1920),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          ' just gifted you ${transaction.amount.toInt()} Plts',
                                                      style: GoogleFonts.lato(
                                                        color: const Color(
                                                          0xFF55506D,
                                                        ),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              // Date
                                              const SizedBox(height: 8),
                                              Text(
                                                formattedTransactionDate,
                                                style: GoogleFonts.lato(
                                                  color:
                                                      const Color(0xFFABABAB),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        // text
                                        Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              'View',
                                              style: GoogleFonts.lato(
                                                color: const Color(0xFF2EAA60),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: AppColor.secondaryColor
                                        .withOpacity(0.7),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomImageText extends StatelessWidget {
  const CustomImageText({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          elevation: 4,
          shape: const OvalBorder(),
          child: Container(
            width: 81,
            height: 81,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              color: Color(0xFFE8DDFF),
              shape: OvalBorder(),
            ),
            child: Image.asset(
              image,
              width: 101,
              height: 55.50,
            ),
          ),
        ),
        Material(
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.4),
          color: Colors.transparent,
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF33313E),
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
