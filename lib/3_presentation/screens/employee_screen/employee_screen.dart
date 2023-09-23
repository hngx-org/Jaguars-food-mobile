import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                const Text(
                  "Search for an employee",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lato',
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const MySearchWidget(),
                const SizedBox(height: 36),
                Text(
                  "All Employees",
                  style: GoogleFonts.lato(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                const SearchBox(
                  text1: "Adekunle Emmanuel",
                ),
                const SearchBox(
                  text1: "Kehinde Ojapa",
                ),
                const SearchBox(
                  text1: "Bolaji Nifemi",
                ),
                const SearchBox(
                  text1: "Oluwanifemi Balogunimil",
                ),
                const SearchBox(
                  text1: "Sandra Imolel",
                ),
                const SearchBox(
                  text1: "Jude bellingham",
                ),
                const SearchBox(
                  text1: "Busayo Davis",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySearchWidget extends StatefulWidget {
  const MySearchWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySearchWidgetState createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  String _searchText = '';
  final List<String> _items = [];
  List<String> _filteredItems = [];

  @override
  Widget build(BuildContext context) {
    _filteredItems = _items.where((item) {
      final String lowercaseItem = item.toLowerCase();
      final String lowercaseSearchText = _searchText.toLowerCase();
      return lowercaseItem.contains(lowercaseSearchText);
    }).toList();

    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColor.appBrandColor,
                  width: 1,
                )),
            fillColor: AppColor.textfieldColor1,
            hintText: 'Search for an employee',
            suffixIcon: const Icon(
              Icons.search,
              size: 35,
              color: AppColor.brand1,
            ),
            // SvgPicture.asset(
            //   Assets.searchPath,
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _filteredItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_filteredItems[index]),
            );
          },
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.text1,
    this.onTap,
  });
  final String text1;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                text1,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.push(RoutesPath.sendLunchDealScreen, extra: {
                  "giftee": text1,
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
        ),
        const SizedBox(height: 14),
        const Divider(
          height: 1,
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
