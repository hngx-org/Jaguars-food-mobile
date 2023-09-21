import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';

class AuthCompleteScreen extends StatelessWidget {
  const AuthCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 160,),
            Text(
              'Hurray! Your organization is all set up',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato'
              ),
            ),
            const SizedBox(height: 40,),
            Image.asset(Assets.buildingImagePath),
            const SizedBox(height: 37,),
            const Text(
              'PriceWaterHouseCoopers Ltd.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff98a2b3),
                fontSize: 22,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'
              ),
            ),
            const SizedBox(height: 65,),
            Text(
              'Invite members',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 11,),
            GestureDetector(
              onTap: (){
                //TODO: navigate to home screen
              },
              child: SizedBox(
                height: 52,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}