import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: const Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_back_ios,
              size: 13,
            ),
            Text('Back')
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sign in to your organization',
                  style: GoogleFonts.lato(
                      fontSize: 24,
                      color: AppColor.appBrandColor,
                      fontWeight: FontWeight.w600)),
            ),
            //Email Address Field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: AppColor.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.appBrandColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            //Password Field
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: AppColor.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      fillColor: AppColor.textfieldColor1,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.appBrandColor,
                          )),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.appBrandColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),

                  //Button
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.appBrandColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            color: AppColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  //Other info
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
