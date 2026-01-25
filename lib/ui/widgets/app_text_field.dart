import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget{
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isPasswordField;

  const AppTextField({super.key, this.prefixIcon, this.suffixIcon, required this.hint , this.isPasswordField=false });
  @override
  Widget build(BuildContext context) {
    var border=OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.lightGray,width: 1),
    );
     return TextField(
       decoration: InputDecoration(
         prefixIcon: prefixIcon,
         suffixIcon: suffixIcon,
         hintText: hint,
         hintStyle: AppStyles.gray14Regular,
         border: border,
         focusedBorder: border,
         errorBorder: border,
         focusedErrorBorder: border,
         enabledBorder: border,
         fillColor: AppColors.white,
         filled: true,
       ),
       obscureText: isPasswordField,
       cursorColor: AppColors.blue,
     );
  }

}