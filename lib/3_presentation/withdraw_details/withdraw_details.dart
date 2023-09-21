import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';

class WithdrawDetailsScreen extends StatefulWidget {
  const WithdrawDetailsScreen({super.key});

  @override
  State<WithdrawDetailsScreen> createState() => _WithdrawDetailsScreenState();
}

class _WithdrawDetailsScreenState extends State<WithdrawDetailsScreen> {
  String? accountNumber = '4567890123';
  String? accountName = 'Gege Akutami';
  bool isVerified = false;
  String selectedBank = 'First Bank';

  List<String> banks = [
    "Access Bank",
    "Zenith Bank",
    "Guaranty Trust Bank (GTB)",
    "First Bank",
    "United Bank for Africa (UBA)",
  ];

  Map<String, String> bankAccountNumbers = {
    "Access Bank": "1234567890",
    "Zenith Bank": "2345678901",
    "Guaranty Trust Bank (GTB)": "3456789012",
    "First Bank": "4567890123",
    "United Bank for Africa (UBA)": "5678901234",
  };

  Map<String, String> bankAccountNames = {
    "Access Bank": "John Doe",
    "Zenith Bank": "Jane Smith",
    "Guaranty Trust Bank (GTB)": "David Johnson",
    "First Bank": "Gege Akutami",
    "United Bank for Africa (UBA)": "Michael Wilson",
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // text
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 40),
                  child: Text(
                    'Redeem your free lunch!',
                    style:
                        GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),

                // container with png
                Container(
                  height: 204,
                  width: 375,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Image.asset(Assets.lunchImagePath)),
                ),
                // text
                Padding(
                  padding: const EdgeInsets.only(top: 33, bottom: 24),
                  child: Text(
                    'Withdraw Details',
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                //three textfields

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        onPressed: _showBankDropdown,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(text: selectedBank),
                    readOnly: true,
                  ),
                ),

                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: "Account number will be displayed here",
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                        ),
                        controller: TextEditingController(text: accountNumber),
                        readOnly: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$accountName',
                              style: GoogleFonts.lato(fontSize: 14),
                            ),
                            Container(

                              width: 24.0,
                              height: 24.0,
                              margin: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(Assets.circleTickImagePath)

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // 3rd textfield
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "How much do you want to redeem?",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      ),
                    )),

                const SizedBox(
                  height: 4,
                ),

                //  texts
                Text('Triple Lunch = N 500', style:
                        GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 14),),
                const SizedBox(height: 30,),
                // withdraw button
                SizedBox(
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Withdraw', style:
                        GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showBankDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select a Bank"),
          content: DropdownButton(
              value: selectedBank,
              items: banks.map((bank) {
                return DropdownMenuItem(
                  value: bank,
                  child: Text(bank),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  if (newValue != null) {
                    selectedBank = newValue;
                    accountNumber = bankAccountNumbers[newValue];
                    accountName = bankAccountNames[newValue];
                  }
                });
                Navigator.of(context).pop();
              }),
        );
      },
    );
  }
}
