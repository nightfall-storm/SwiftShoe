import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class AkTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AkTabBar({
    super.key,
    required this.tabs,
  });
  
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Material(
      color: isDarkMode ? AkColors.black : AkColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AkColors.black,
        unselectedLabelColor: AkColors.darkGrey,
        labelColor: isDarkMode ? AkColors.white : AkColors.dark,
        tabAlignment: TabAlignment.start,  // Align tabs to the start
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
