import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaguar_foods_mobile/1_data/models/transactions.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/nav_screen/nav_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:intl/intl.dart';

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
        id: json['id'].toString(), senderId: '', status: '',
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
        body: SingleChildScrollView(
          child: Container(
            width: mediaQuery.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //welcome title and profile image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: mediaQuery.width * 0.6,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome ${firstName}! 👋',
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: mediaQuery.width * 0.065,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                color: Color(0xFFABABAB),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                height: 0.14,
                                letterSpacing: -0.14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 49,
                        height: 49,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(),
                        ),
                        child: Image.asset('assets/png/sample_profile.png'),
                      ),
                    ],
                  ),
                  //redeem , gift
                  Material(
                    elevation: 3,
                    child: Container(
                      width: mediaQuery.width,
                      height: mediaQuery.height * 0.23,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //redeem
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NavigationScreen(
                                      initialIndex: 1,
                                    ),
                                  ),
                                );
                              },
                              child: CustomImageText(
                            image: 'assets/png/tag.png',
                            text: 'Redeem',
                          )),
                          //gift
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => NavigationScreen(
                                    initialIndex: 2
                                  ),
                                ),
                              );
                            },
                            child: CustomImageText(
                              image: 'assets/png/gift.png',
                              text: 'Gift',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //received rewards
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Received Rewards',
                        style: TextStyle(
                          color: Color(0xFF55506D),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFFABABAB),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  //item
                  Material(
                    elevation: 7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        final formattedTransactionDate =
                        DateFormat('d MMM, HH:mm').format(transaction.createdAt);

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //gift icon
                                  Material(
                                    elevation: 4,
                                    color: Colors.transparent,
                                    shape: OvalBorder(),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      padding: EdgeInsets.all(10),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFE8DDFF),
                                        shape: OvalBorder(),
                                      ),
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          AppColor.appBrandColor,
                                          BlendMode.srcIn,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/gift_icon.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox( width: 15,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: transaction.receiverId,
                                                style: TextStyle(
                                                  color: Color(0xFF1A1920),
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' just gifted you ${transaction.amount.toInt()} Plts',
                                                style: TextStyle(
                                                  color: Color(0xFF55506D),
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                        // Date
                                        SizedBox(height: 8),
                                        Text(
                                          formattedTransactionDate,
                                          style: TextStyle(
                                            color: Color(0xFFABABAB),
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox( width: 20,),
                                  // text
                                  Material(
                                    elevation: 8,
                                    color: Colors.transparent,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'View',
                                        style: TextStyle(
                                          color: Color(0xFF2EAA60),
                                          fontSize: 12,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w600,
                                          height: 0.19,
                                          letterSpacing: -0.12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(color: AppColor.secondaryColor.withOpacity(0.7), ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
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
          shape: OvalBorder(),
          child: Container(
            width: 81,
            height: 81,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
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
            style: TextStyle(
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
