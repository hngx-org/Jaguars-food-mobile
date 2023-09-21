import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      // appBar: AppBar(
      //   backgroundColor: AppColor.white,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                SizedBox(height: 28),
                const Text(
                  "Search for an employee",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lato',
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                MySearchWidget(),
                const SizedBox(height: 36),
                const Text(
                  "All Employees",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
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
  @override
  _MySearchWidgetState createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  String _searchText = '';
  List<String> _items = [];
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
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.white,
                width: 2.0, // Set the desired border color here
              ),
            ),
            filled: true,
            fillColor: AppColor.textfieldColor1,
            hintText: 'Search for an employee',
            suffixIcon: SvgPicture.asset(Assets.searchPath),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
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
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColor.brand,
                  radius: 18,
                  child: SvgPicture.asset(
                    Assets.giftIconPath,
                    color: AppColor.appBrandColor,
                  )),
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    color: AppColor.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Expanded(
                  child: Text(
                    "Send gift",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Lato',
                        color: AppColor.lightgreen),
                  ),
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
      ),
    );
  }
}
