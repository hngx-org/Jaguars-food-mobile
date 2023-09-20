// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget {
//   const MyAppBar({
//      Key? key,
//     this.onMoreTap,
//     this.hasMoreButton = false,
//     this.hasBackButton = false,
//     this.prefixIcon,
//     this.top = true,
//     this.hasBorder = true,
//     this.suffixIcon,
//     this.titleWidget,
//     this.title,
    
//     }); : super(key: key);
//      final String? title;
//   final bool top, hasBorder;
//   final Widget? titleWidget, prefixIcon, suffixIcon;
//   final bool hasBackButton;
//   final bool hasMoreButton;
//   final Function()? onMoreTap;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body :SafeArea(
//       top: top,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.transparent,
//             border: Border(
//                 bottom: hasBorder
//                     ? const BorderSide(color: AppColors.greyEE)
//                     : BorderSide.none)),
//         padding:
//             EdgeInsets.symmetric(horizontal: Sizer.width(kHorizontalPadding)),
//         height: Sizer.height(60),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: Sizer.width(60),
//                   alignment: Alignment.centerLeft,
//                   child: Visibility(
//                     visible: hasBackButton,
//                     maintainSize: hasBackButton,
//                     maintainAnimation: hasBackButton,
//                     maintainState: hasBackButton,
//                     child: prefixIcon != null
//                         ? prefixIcon!
//                         : InkWell(
//                             onTap: () {
//                               return Navigator.pop(context);
//                             },
//                             child: SizedBox(
//                               height: Sizer.height(40),
//                               width: Sizer.width(40),
//                               child: Center(
//                                 child: AppIcon(
//                                   AppIcons.back,
//                                   color: AppColors.black,
//                                   size: Sizer.radius(24),
//                                 ),
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//                 title != null
//                     ? Text(
//                         title!,
//                         style: AppTypography.text16b
//                             .copyWith(color: AppColors.black),
//                       )
//                     : titleWidget != null
//                         ? titleWidget!
//                         : const SizedBox(),
//                 Container(
//                   width: Sizer.width(60),
//                   alignment: Alignment.centerRight,
//                   child: Visibility(
//                     visible: hasMoreButton,
//                     maintainSize: hasMoreButton,
//                     maintainAnimation: hasMoreButton,
//                     maintainState: hasMoreButton,
//                     child: suffixIcon != null
//                         ? suffixIcon!
//                         : InkWell(
//                             onTap: onMoreTap,
//                             child: SizedBox(
//                               height: Sizer.height(40),
//                               width: Sizer.width(40),
//                               child: const Icon(
//                                 Icons.more_horiz,
//                                 color: AppColors.black,
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//     );
//   }
// }