import 'package:flutter/material.dart';
import 'package:shoes_store/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class AkTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AkTabBar({
    super.key, required this.tabs,
  });
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Material(
      color: isDarkMode ? AkColors.white : AkColors.dark,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AkColors.black,
        unselectedLabelColor: AkColors.darkGrey,
        labelColor: isDarkMode ? AkColors.white : AkColors.dark,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AkDeviceUtils.getAppBarHeight());
  
}
