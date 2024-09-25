import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/features/personalization/screens/profile/profile.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/circular_image.dart';

class AkUserProfileTile extends StatelessWidget {
  const AkUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AkCircularImage(
        image: AkImages.user,
        width: 50,
        height: 50,
        padding: 0,
        applyColor: false,
        applyOverlayColor: false,
      ),
      title: Text(
        'Hello, nightfall',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: AkHelperFunctions.isDarkMode(context)
                ? AkColors.white
                : AkColors.black),
      ),
      subtitle: Text(
        'night-fall@gmail.com',
        style: Theme.of(context).textTheme.labelMedium!.apply(
            color: AkHelperFunctions.isDarkMode(context)
                ? AkColors.white
                : AkColors.black),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(const ProfileScreen()),
          icon: Icon(
            Iconsax.edit,
            color: AkHelperFunctions.isDarkMode(context)
                ? AkColors.white
                : AkColors.black,
          )),
    );
  }
}
