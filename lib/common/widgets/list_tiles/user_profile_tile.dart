import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/styles/shimmer_style.dart';
import 'package:shoes_store/features/personalization/controllers/user_controller.dart';
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
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : AkImages.user;

        return controller.imageUploading.value
            ? const AkShimmerEffect(
                width: 80,
                height: 80,
                radius: 80,
              )
            : AkCircularImage(
                image: image,
                width: 50,
                height: 50,
                padding: 0,
                applyColor: false,
                applyOverlayColor: false,
                isNetworkImage: networkImage.isNotEmpty);
      }),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const AkShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            'Hello, ${controller.user.value.username}',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: AkHelperFunctions.isDarkMode(context)
                      ? AkColors.white
                      : AkColors.black,
                ),
          );
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoading.value) {
          return const AkShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.email,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                color: AkHelperFunctions.isDarkMode(context)
                    ? AkColors.white
                    : AkColors.black),
          );
        }
      }),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: Icon(
            Iconsax.edit,
            color: AkHelperFunctions.isDarkMode(context)
                ? AkColors.white
                : AkColors.black,
          )),
    );
  }
}
