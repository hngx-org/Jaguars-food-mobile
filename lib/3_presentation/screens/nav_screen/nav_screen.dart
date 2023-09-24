import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/redeem_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/employee_screen/employee_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/home/home_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_nav_bar.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    Key? key,
    required this.initialIndex,
    this.token,
  }) : super(key: key);
  final String? token;
  final int initialIndex;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  late List<Widget> _tabScreens;
  late Map<String, dynamic> _user = {};
  List _allLunch = [];
  final List _allLunchSenderNames = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          milliseconds: 1500,
        ), () async {
      _loadUser();
    });

    _selectedIndex = widget.initialIndex;
    _tabScreens = [
      HomeScreen(
        token: widget.token,
        firstName: _user['firstName'] ?? '',
        lunchBalance: _user['launchCreditBalance'] ?? '',
        allLunch: const [],
        allLunchSenderNames: _allLunchSenderNames,
      ),
      const EmployeeScreen(),
      const RedeemScreen(),
      const SettingsScreen(),
    ];
  }

// load user details
  Future<void> _loadUser() async {
    if (_selectedIndex == 0) {
      CustomDialog().showLoadDialog(context);
    }
    final response = await Auth.loadUser(widget.token!);

    if (response.toString().contains('error')) {
      if (_selectedIndex == 0) {
        if (routerConfig.canPop()) {
          routerConfig.pop();
        }
      }
      _showDialog(
        'error',
        'Error',
        response['message'],
        'Ok',
      );
    } else {
      final response2 = await Auth.getUserLunch(widget.token!);

      if (response2.toString().contains('error')) {
        if (_selectedIndex == 0) {
          if (routerConfig.canPop()) {
            routerConfig.pop();
          }
        }
        _showDialog(
          'error',
          'Error',
          response['message'],
          'Ok',
        );
      } else {
        final response3 = await Auth.getAllUser(widget.token!);

        if (response3.toString().contains('error')) {
          if (_selectedIndex == 0) {
            if (routerConfig.canPop()) {
              routerConfig.pop();
            }
          }
          _showDialog(
            'error',
            'Error',
            response['message'],
            'Ok',
          );
        } else {
          if (_selectedIndex == 0) {
            if (routerConfig.canPop()) {
              routerConfig.pop();
            }
          }

          _allLunch = response2['data']['lunches'];

          final list = response3['data'];

          for (int i = 0; i < _allLunch.length; i++) {
            for (var item in list) {
              if (item.containsKey('id')) {
                if (item['id'] == _allLunch[i]['senderId']) {
                  if (_allLunch.length != _allLunchSenderNames.length) {
                    setState(() {
                      _allLunchSenderNames.add(item['firstName']);
                    });
                  }
                }
              }
            }
          }

          setState(() {
            _tabScreens = [
              HomeScreen(
                token: widget.token,
                firstName: _user['firstName'] ?? '',
                lunchBalance: _user['launchCreditBalance'] ?? '',
                allLunch: _allLunch,
                allLunchSenderNames: _allLunchSenderNames,
              ),
              const EmployeeScreen(),
              const RedeemScreen(),
              const SettingsScreen(),
            ];
            _allLunch = response2['data']['lunches'];
            _user = response;
          });
        }
      }
    }
  }

  // Function to handle tab selection
  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _showDialog(
    String type,
    String title,
    String body,
    String buttontext,
  ) {
    CustomDialog().showAlertDialog(
      context,
      type,
      title,
      body,
      buttontext,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadUser,
        child: _tabScreens[_selectedIndex],
      ),
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
