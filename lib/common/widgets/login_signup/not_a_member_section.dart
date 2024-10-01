import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class NotMemberSection extends StatelessWidget {
  const NotMemberSection({
    super.key,
    required this.firstText,
    required this.secondText,
    this.getTo,
  });
  final String firstText;
  final String secondText;
  final VoidCallback? getTo;

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
          onPressed: getTo,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(5), // Remove default padding
          ),
          child: Text(
            secondText,
            style: TextStyle(
              color: dark ? AkColors.white : AkColors.primary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
