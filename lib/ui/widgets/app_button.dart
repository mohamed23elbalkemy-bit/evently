import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  TextStyle textStyle;
  final Widget? icon;
  final VoidCallback onPress;

  AppButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.blue,
    this.icon,
    required this.onPress,
    this.textStyle = AppStyles.white18Medium,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, SizedBox(width: 16)],
          Text(text, style:textStyle),
        ],
      ),
    );
  }
}
