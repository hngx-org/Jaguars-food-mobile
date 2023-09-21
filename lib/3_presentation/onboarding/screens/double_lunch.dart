import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';

class DoubleLunch extends StatelessWidget {
  const DoubleLunch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 40),
                child: Text(
                  "You’re gifting Adekunle Emmanuel!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),

              // container with png
              // text
              Padding(
                padding: const EdgeInsets.only(top: 33, bottom: 24),
                child: Align(
                  child: Text(
                    'Double Lunch',
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 204,
                width: 375,
                decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(child: Image.asset(Assets.lunchImagePath)),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Text(
                  "Add remark",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: TextField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              // send button
              SizedBox(
                height: 52,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Send',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
