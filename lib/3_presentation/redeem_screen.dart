import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';

// dummy data
class Reward{
  final String sender;
  final DateTime time;
  final bool isLunch; // lunch or cash
  final int amount;
  const Reward(
    this.sender,
    this.time,
    this.isLunch,
    this.amount
  );
}
List<Reward> rewards = [
  Reward('Shola Peters', DateTime(2023, 9, 15, 12, 48), true, 0),
  Reward('Ajayi James', DateTime(2023, 9, 15, 12, 48), false, 50),
  Reward('Shola Peters', DateTime(2023, 9, 15, 12, 48), true, 0),

];




class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}
class _RedeemScreenState extends State<RedeemScreen> {
  late Future<List<Reward>> content;
  late Future<List<Reward>> displayedResult;
  late TextEditingController controller;

  Future<List<Reward>> getRewards(){
    return Future.delayed(const Duration(seconds: 1), (){
    return rewards;
    });
  }

  void search(String sender){
    setState(() {
        displayedResult = content.then((value){
        return value.where((element){
          return element.sender.toLowerCase().contains(sender.toLowerCase());
        }).toList();
      });
    });
  }


  @override
  void initState(){
    super.initState();
    content = getRewards();
    displayedResult = content;
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 107),
            const Text(
              'Redeem your rewards',
              style: TextStyle(
                color: Color(0xff33313e),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              )
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 57,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffececec),
                  borderRadius: BorderRadius.circular(1)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Center(
                          child: TextField(
                            onChanged: (value){
                              search(value);
                            },
                            controller: controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 10),
                              hintText: 'Search for reward',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xffa5a5a5)
                              )
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: SvgPicture.asset(Assets.searchIconPath,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 74,),
            Row(
              children: [
                const Text(
                  'All rewards',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff55516d),
                    fontWeight: FontWeight.w500
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      displayedResult = content; // resets the content to display all
                      controller.clear(); // remove the text from the textfield
                      FocusScope.of(context).requestFocus(FocusNode()); // dismiss the keyboard
                    });
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffababab)
                    )
                  ),
                )
              ],
            ),
            const SizedBox(height: 18,),
            FutureBuilder(
              future: displayedResult,
              builder: (context, snapshot){
                if (snapshot.hasData & (snapshot.data != null)){
                  return DisplayContent(snapshot.data?? []);
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}


class DisplayContent extends StatelessWidget {
  final List<Reward> content;
  const DisplayContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        content.length, (index){
          return Column(
            children: [
              const SizedBox(height: 10,),
              SizedBox(
                height: 47,
                child: Row(
                  children: [
                    content[index].isLunch? const LunchIcon(): const GiftIcon(), 
                    const SizedBox(width: 9,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            (content[index].isLunch
                            ? const Text(
                                'Free lunch',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            : Text(
                              '\$${content[index].amount}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                              )),
                            Text(
                              ' from ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant
                              ),
                            ),
                            Text(
                              content[index].sender,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                        const Text(
                          '15, sep, 12:48',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffababab)
                          ),
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    const Text( // TODO: navigate when pressed
                      'Redeem',
                      style: TextStyle(
                        fontSize: 12,
                        color:  Color(0xff2eaa60)
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              const Divider(),
            ],
          );
        }),
    );
  }
}




enum Accent {primary, secondary}

class GiftIcon extends StatelessWidget {
  final Accent accent;
  const GiftIcon({
    this.accent = Accent.primary,
    super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = switch(accent){
      Accent.primary => const Color(0xffe8ddff),
      Accent.secondary => const Color(0xffd3ffe5),
    };
    Color color = switch(accent){
      Accent.primary => const Color(0xff571fcd),
      Accent.secondary => const Color(0xff2eaa60),
    };
    return SizedBox(
      height: 36,
      width: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: backgroundColor
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.giftIconPath,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn
            ),
          ),
        ),
      ),
    );
  }
}

class LunchIcon extends StatelessWidget {
  const LunchIcon({
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xffd3ffe5)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Image.asset(Assets.lunchImagePath),
          )
        ),
      ),
    );
  }
}