import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28),
                Text(
                  "Search for an employee",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 28),
                MySearchWidget(),
                SizedBox(height: 54),
                Text(
                  "All Employees",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 54),
                SearchBox(
                  icon: Icons.access_alarm,
                  text1: "Kehinde Ojapa",
                ),
                SearchBox(
                  icon: Icons.access_alarm,
                  text1: "Bolaji Nifemi",
                ),
                SearchBox(
                  icon: Icons.access_alarm,
                  text1: "Oluwanifemi Balogunimil",
                ),
                SearchBox(
                  icon: Icons.access_alarm,
                  text1: "Sandra Imolel",
                ),
                SearchBox(
                  icon: Icons.access_alarm,
                  text1: "Jude bellingham",
                ),
                SearchBox(
                  icon: Icons.access_alarm,
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
  List<String> _items = [
    'Adekunle Emmanuel',
    'Kehinde Ojapa',
    'Bolaji Nifemi',
    'Oluwanifemi Balogunimi',
    'Sandra Imole',
    'Jude bellingham',
    'Busayo Davis',
  ];
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
            hintText: 'Search...',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 16.0),
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
    required this.icon,
    required this.text1,
    this.onTap,
  });

  final String text1;

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.appBrandColor,
                radius: 18,
                child: Icon(icon),
              ),
              SizedBox(width: 13),
              Expanded(
                child: Text(
                  text1,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Expanded(
                  child: Text(
                    "Send gift",
                    style: TextStyle(fontSize: 12, color: AppColor.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
