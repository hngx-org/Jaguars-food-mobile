import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/redeem_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/employee_screen/employee_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/home/home_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  final int initialIndex;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  late List<Widget> _tabScreens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _tabScreens = [
      const HomeScreen(),
      const EmployeeScreen(),
      const RedeemScreen(),
      const SettingsScreen(),
    ];
  }

  // Function to handle tab selection
  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabScreens[_selectedIndex],
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
