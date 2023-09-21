import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String svgAsset;
  final String label;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;
  final double? space;
  final double? size;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.svgAsset,
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
    this.space,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              isSelected ? selectedColor : unselectedColor,
              BlendMode.srcIn,
            ),
            child: SizedBox(
              width: size ?? 32,
              child: SvgPicture.asset(
                svgAsset,
              ),
            ),
          ),
          SizedBox(
            height: space,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? selectedColor : unselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
