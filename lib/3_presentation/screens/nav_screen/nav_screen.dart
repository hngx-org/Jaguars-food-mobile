import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/1_data/models/transactions.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_nav_bar.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    Key? key,
    required this.initialIndex,
    this.token,
  }) : super(key: key);
  final String? token;
  final int initialIndex;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  Map<String, dynamic> _user = {};
  List _allLunch = [];
  List _allLunchSenderNames = [];
  List<dynamic> _allUsers = [];
  List<Transactions> transactions = [];
  late PageController _pageController;
  String _quantity = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.initialIndex;
      _pageController = PageController(initialPage: _selectedIndex);
    });

    Future.delayed(
        const Duration(
          milliseconds: 1000,
        ), () async {
      _loadUser();
    });
  }

// load user details
  Future<void> _loadUser() async {
    CustomDialog().showLoadDialog(context);

    final response = await Auth.loadUser(widget.token!);

    try {
      if (response.toString().contains('error')) {
        if (routerConfig.canPop()) {
          routerConfig.pop();
        }

        _showDialog(
          'error',
          'Error',
          response['message'],
          'Ok',
        );
      } else {
        setState(() {
          _user = response;
        });

        final response2 = await Auth.getUserLunch(widget.token!);

        if (response2.toString().contains('error')) {
          if (routerConfig.canPop()) {
            routerConfig.pop();
          }
          _showDialog(
            'error',
            'Error',
            response['message'],
            'Ok',
          );
        } else {
          setState(() {
            _allLunch = response2['data']['lunches'];
          });

          dynamic response3 = [];
          List userNames = [];

          if (_allLunch.isNotEmpty) {
            for (int i = 0; i < _allLunch.length; i++) {
              response3 = await Auth.searchUser(
                  widget.token!, _allLunch[i]['senderId']);

              setState(() {
                userNames.add(response3['users'][0]);
              });
            }

            if (response3.toString().contains('error')) {
              if (routerConfig.canPop()) {
                routerConfig.pop();
              }

              _showDialog(
                'error',
                'Error',
                response['message'],
                'Ok',
              );
            } else {
              final response4 = await Auth.getAllUser(widget.token!);
              if (response4.toString().contains('error') ||
                  response4.toString().contains('fail')) {
                if (routerConfig.canPop()) {
                  routerConfig.pop();
                }
              } else {
                if (routerConfig.canPop()) {
                  routerConfig.pop();
                }
                setState(() {
                  _allUsers = response4['data'];
                  _allLunchSenderNames = userNames;
                  final transactionJson = _allLunch;
                  transactions = transactionJson.map((json) {
                    return Transactions(
                      receiverId: json['receiverId'].toString(),
                      amount: json['quantity'].toString(),
                      createdAt: DateTime.parse(json['createdAt'].toString()),
                      id: json['id'].toString(),
                      senderId: json['senderId'].toString(),
                      note: json['note'].toString(),
                      isRedeemed: json['redeemed'],
                    );
                  }).toList();
                });
              }
            }
          } else {
            final response4 = await Auth.getAllUser(widget.token!);
            if (response4.toString().contains('error') ||
                response4.toString().contains('fail')) {
              if (_selectedIndex == 0) {
                if (routerConfig.canPop()) {
                  routerConfig.pop();
                }
              }
            } else {
              if (_selectedIndex == 0) {
                if (routerConfig.canPop()) {
                  routerConfig.pop();
                }
              }
              setState(() {
                _allUsers = response4['data'];
                _allLunchSenderNames = userNames;
                final transactionJson = _allLunch;
                transactions = transactionJson.map((json) {
                  return Transactions(
                    receiverId: json['receiverId'].toString(),
                    amount: json['quantity'].toString(),
                    createdAt: DateTime.parse(json['createdAt'].toString()),
                    id: json['id'].toString(),
                    senderId: json['senderId'].toString(),
                    note: json['note'].toString(),
                    isRedeemed: json['redeemed'],
                  );
                }).toList();
              });
            }
          }
        }
      }
    } on Error catch (e) {
      if (routerConfig.canPop()) {
        routerConfig.pop();
      }

      _showDialog(
        'error',
        'Error',
        'An error occured $e',
        'Ok',
      );
    }
  }

  // Function to handle tab selection
  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  _showDialog(
    String type,
    String title,
    String body,
    String buttontext,
  ) {
    CustomDialog().showAlertDialog(
      context,
      type,
      title,
      body,
      buttontext,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final currentDateTime = DateTime.now();
    final formattedDate = DateFormat('d, MMMM yyyy').format(currentDateTime);
    return Scaffold(
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: _loadUser,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.w),
              height: MediaQuery.sizeOf(context).height,
              child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        //welcome title and profile image
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome ${_user['firstName']} 👋',
                                    style: GoogleFonts.lato(
                                      color: AppColor.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5.h,
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
                              child:
                                  Image.asset('assets/png/sample_profile.png'),
                            ),
                          ],
                        ),
                        //redeem , gift

                        SizedBox(
                          height: 30.h,
                        ),
                        Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: mediaQuery.width,
                            height: 120.h,
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lunch Balance 💰',
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₦${_user['lunchCreditBalance']}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                routerConfig.push(
                                                    RoutesPath
                                                        .withdrawDetailsScreen,
                                                    extra: {
                                                      'token': widget.token,
                                                    });
                                              },
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
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
                                                image: AssetImage(
                                                    Assets.cheeseImagePath),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.r)),
                                  elevation: 2,
                                  child: InkWell(
                                    onTap: () => onTabSelected(2),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      padding: const EdgeInsets.all(7),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFE8DDFF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: const ShapeDecoration(
                                                color: Color(0x3D571FCD),
                                                shape: CircleBorder(),
                                              ),
                                              child: Image.asset(
                                                  Assets.tagImagePath)),
                                          Text(
                                            'Redeem',
                                            style: GoogleFonts.lato(
                                              color: const Color(0xFF571FCD),
                                              fontSize: 18.sp,
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
                              //gift lunch
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  elevation: 2,
                                  child: InkWell(
                                    onTap: () => onTabSelected(1),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.h,
                                      padding: const EdgeInsets.all(7),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFD3FFE5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: const ShapeDecoration(
                                              color: Color(0x3A07A537),
                                              shape: CircleBorder(),
                                            ),
                                            child: Image.asset(
                                              Assets.lunchImagePath,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            'Gift Lunch',
                                            style: GoogleFonts.lato(
                                              color: const Color(0xFF2EAA60),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
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
                        Column(
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
                            Material(
                              color: Colors.transparent,
                              child: Visibility(
                                visible: _allLunch.isNotEmpty,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _allLunch.length,
                                  itemBuilder: (context, index) {
                                    final transaction = transactions[index];

                                    final formattedTransactionDate =
                                        DateFormat('d MMM, HH:mm')
                                            .format(transaction.createdAt);
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
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
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration:
                                                      const ShapeDecoration(
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
                                                            text:
                                                                _allLunchSenderNames[
                                                                        index]
                                                                    ['name'],
                                                            style: GoogleFonts
                                                                .lato(
                                                              color: const Color(
                                                                  0xFF1A1920),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                ' just gifted you ${transaction.amount} Plts',
                                                            style: GoogleFonts
                                                                .lato(
                                                              color:
                                                                  const Color(
                                                                0xFF55506D,
                                                              ),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    // Date
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      formattedTransactionDate,
                                                      style: GoogleFonts.lato(
                                                        color: const Color(
                                                            0xFFABABAB),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    'View',
                                                    style: GoogleFonts.lato(
                                                      color: const Color(
                                                          0xFF2EAA60),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                        10.verticalSpace
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _allLunch.isEmpty,
                              child: Center(
                                child: Text(
                                  'No rewards yet',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Search for an employee",
                          style: GoogleFonts.lato(
                            fontSize: 24.sp,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          onTapOutside: (event) {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: AppColor.appBrandColor,
                                  width: 1,
                                )),
                            filled: true,
                            fillColor: const Color(0xFFF4F4F4),
                            hintText: 'Search for an employee',
                            hintStyle: GoogleFonts.lato(),
                            suffixIconConstraints: BoxConstraints(
                              minHeight: 24.h,
                              minWidth: 24.w,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SvgPicture.asset(
                                Assets.searchPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                width: 1,
                                color: Color(0xFFF4F4F4),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.w,
                                color: const Color(0xFFF4F4F4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        Text(
                          "All Employees (${_allUsers.length})",
                          style: GoogleFonts.lato(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _allUsers.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: AppColor.brand,
                                    radius: 18,
                                    child: SvgPicture.asset(
                                      Assets.giftIconPath,
                                    )),
                                const SizedBox(width: 13),
                                Expanded(
                                  child: Text(
                                    "${_allUsers[index]['firstName']} ${_allUsers[index]['lastName']}",
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.push(RoutesPath.sendLunchDealScreen,
                                        extra: {
                                          "giftee":
                                              "${_allUsers[index]['firstName']} ${_allUsers[index]['lastName']}",
                                          "token": widget.token,
                                          "gifteeId":
                                              _allUsers[index]['id'].toString(),
                                        });
                                  },
                                  child: Text(
                                    "Send gift",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'Lato',
                                        color: AppColor.lightgreen),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          child: TextField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            onTapOutside: (event) {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                    color: AppColor.appBrandColor,
                                    width: 1,
                                  )),
                              filled: true,
                              fillColor: const Color(0xFFF4F4F4),
                              hintText: 'Search for rewards',
                              hintStyle: GoogleFonts.lato(),
                              suffixIconConstraints: BoxConstraints(
                                minHeight: 24.h,
                                minWidth: 24.w,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: SvgPicture.asset(
                                  Assets.searchPath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1,
                                  color: Color(0xFFF4F4F4),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.w,
                                  color: const Color(0xFFF4F4F4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All rewards',
                              style: GoogleFonts.lato(
                                color: const Color(0xFF55506D),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: null,
                              child: Text(
                                'See all',
                                style: GoogleFonts.lato(
                                  color: const Color(0xFFABABAB),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _allLunch.isNotEmpty,
                          child: Expanded(
                            child: ListView.builder(
                                itemCount: _allLunch.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(8),
                                            height: 40.h,
                                            width: 40.w,
                                            constraints: BoxConstraints(
                                              minWidth: 24.w,
                                              minHeight: 24.h,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFEFFFF5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                                'assets/png/lunch.png')),
                                        SizedBox(width: 10.w),
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
                                                      text: transactions[index]
                                                                  .amount ==
                                                              '1'
                                                          ? 'Single lunch'
                                                          : transactions[index]
                                                                      .amount ==
                                                                  '2'
                                                              ? 'Double lunch'
                                                              : transactions[index]
                                                                          .amount ==
                                                                      '3'
                                                                  ? 'Triple lunch'
                                                                  : 'Quadruple lunch',
                                                      style: GoogleFonts.lato(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 21, 21, 21),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: ' from ',
                                                      style: GoogleFonts.lato(
                                                        color: const Color(
                                                            0xFF55506D),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          _allLunchSenderNames[
                                                                  index]['name']
                                                              .toString(),
                                                      style: GoogleFonts.lato(
                                                        color: const Color(
                                                            0xFF1B1A21),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                '15 Sep, 12:48',
                                                style: GoogleFonts.lato(
                                                  color:
                                                      const Color(0xFFABABAB),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        InkWell(
                                          onTap: _allLunch[index]['redeemed'] ==
                                                  false
                                              ? () async {
                                                  routerConfig.push(
                                                      RoutesPath
                                                          .confirmRedeemScreen,
                                                      extra: {
                                                        'token': widget.token,
                                                        "id": _allLunch[index]
                                                                ['id']
                                                            .toString(),
                                                        "lunchType": transactions[
                                                                        index]
                                                                    .amount ==
                                                                '1'
                                                            ? 'Single lunch'
                                                            : transactions[index]
                                                                        .amount ==
                                                                    '2'
                                                                ? 'Double lunch'
                                                                : transactions[index]
                                                                            .amount ==
                                                                        '3'
                                                                    ? 'Triple lunch'
                                                                    : 'Quadruple lunch',
                                                        "sender":
                                                            _allLunchSenderNames[
                                                                        index]
                                                                    ['name']
                                                                .toString()
                                                      });
                                                }
                                              : null,
                                          child: Text(
                                            _allLunch[index]['redeemed'] ==
                                                    false
                                                ? 'Redeem'
                                                : 'Redeemed',
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.lato(
                                              color: _allLunch[index]
                                                          ['redeemed'] ==
                                                      false
                                                  ? const Color(0xFF2EAA60)
                                                  : Colors.grey.shade400,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Visibility(
                          visible: _allLunch.isEmpty,
                          child: Center(
                            child: Text(
                              'No rewards yet',
                              style: GoogleFonts.lato(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SettingsScreen(),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTabSelected,
        selectedItemColor: AppColor.appBrandColor,
        unselectedItemColor: AppColor.secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: CustomBottomNavigationBarItem(
              svgAsset: 'assets/svg/home_icon.svg',
              label: 'Home',
              isSelected: _selectedIndex == 0,
              selectedColor: AppColor.appBrandColor,
              unselectedColor: AppColor.secondaryColor,
              onTap: () => onTabSelected(0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavigationBarItem(
              svgAsset: 'assets/svg/employees_icon.svg',
              label: 'Employees',
              isSelected: _selectedIndex == 1,
              selectedColor: AppColor.appBrandColor,
              unselectedColor: AppColor.secondaryColor,
              onTap: () => onTabSelected(1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavigationBarItem(
              svgAsset: 'assets/svg/rewards_icon.svg',
              label: 'Rewards',
              space: 7,
              size: 22,
              isSelected: _selectedIndex == 2,
              selectedColor: AppColor.appBrandColor,
              unselectedColor: AppColor.secondaryColor,
              onTap: () => onTabSelected(2),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavigationBarItem(
              svgAsset: 'assets/svg/settings_icon.svg',
              label: 'Settings',
              space: 7,
              size: 22,
              isSelected: _selectedIndex == 3,
              selectedColor: AppColor.appBrandColor,
              unselectedColor: AppColor.secondaryColor,
              onTap: () => onTabSelected(3),
            ),
            label: '',
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Screen'),
    );
  }
}
