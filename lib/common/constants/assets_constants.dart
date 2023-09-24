class Assets {
  static const pngPath = "assets/png";
  static const svgPath = "assets/svg";
  static const jaguarPath = "assets/jaguars";

  static List<String> jagPaths = List.generate(10, (index) {
    final jagNumber = index + 1;
    return '$jaguarPath/jag$jagNumber.jpg';
  });

  static String cashImagePath = '$pngPath/cash.png';
  static String circleTickImagePath = '$pngPath/circle_tick.png';
  static String giftImagePath = '$pngPath/gift.png';
  static String lunchImagePath = '$pngPath/lunch.png';
  static String tagImagePath = '$pngPath/tag.png';
  static String appLogoPath = '$pngPath/app_logo.png';
  static String buildingImagePath = '$pngPath/building.png';
  static String peopleImagePath = '$pngPath/people.png';
  static String cheeseImagePath = '$pngPath/cheese.png';
  static String splashImagePath = '$pngPath/splash_logo.png';
  static String sendImagePath = '$pngPath/send.png';
  static String sampleProfile = '$pngPath/sample_profile.png';

  static String employeesIconPath = '$svgPath/employees_icon.svg';
  static String giftIconPath = '$svgPath/gift_icon.svg';
  static String homeIconPath = '$svgPath/home_icon.svg';
  static String rewardsIconPath = '$svgPath/rewards_icon.svg';
  static String settingsIconPath = '$svgPath/settings_icon.svg';
  static String giftBagPath = '$svgPath/gift-bag.svg';
  static String redeemNewPath = '$svgPath/redeem-new.svg';
  static String searchPath = '$svgPath/search.svg';
  static String backArrowIconPath = '$svgPath/arrow_back.svg';
  static String searchIconPath = '$svgPath/search_icon.svg';
  static String buildingIconPath = '$svgPath/building_icon.svg';
  static String smallHomeIconPath = '$svgPath/home.svg';
  static String arrowDownIcon = '$svgPath/arrow-down.svg';
  static String copyIcon = '$svgPath/copy_icon.svg';
  static String emailIcon = '$svgPath/email_icon.svg';
  static String addIcon = '$svgPath/add_org.svg';
  static String sendIcon = '$svgPath/message.svg';
}
