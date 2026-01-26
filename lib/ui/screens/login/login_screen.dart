import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_dialogs.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:evently/ui/widgets/app_button.dart';
import 'package:evently/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Image.asset(AppAssets.appLogo),
                SizedBox(height: 48),
                Text("Login to your account", style: AppStyles.blue24SemiBold),
                SizedBox(height: 24),
                AppTextField(
                  hint: "Enter your email",
                  isPasswordField: false,
                  prefixIcon: Image.asset(AppAssets.icEmail),
                ),
                SizedBox(height: 16),
                AppTextField(
                  hint: "Enter your password",
                  isPasswordField: true,
                  prefixIcon: Image.asset(AppAssets.icLock),
                  suffixIcon: Image.asset(AppAssets.icEyeClosed),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: (){
                    Navigator.push(context, AppRoutes.forGetPassword);
                  },
                  child: Text(
                    "Forget Password?",
                    style: AppStyles.blue14SemiBold.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor : AppColors.blue,
                      decorationThickness: 2,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 48),
                buildLoginButton(),
                SizedBox(height: 37),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Don’t have an account ?  ",style: AppStyles.gray14Regular,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,AppRoutes.registerScreen);
                    },
                    child: Text("Signup",style: AppStyles.blue14SemiBold.copyWith(decoration:TextDecoration.underline,decorationColor : AppColors.blue,
                      decorationThickness: 2,  ),),
                  )
                ],),
                SizedBox(height: 37),
                Text("Or",style: AppStyles.blue18Medium,textAlign: TextAlign.center,),
                SizedBox(height: 37),
                AppButton(
                    text: "Login with Google", onPress: (){},
                  backgroundColor: AppColors.white,
                  textStyle: AppStyles.blue18Medium,
                  icon: Image.asset(AppAssets.icGmail),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppButton buildLoginButton() {
    return AppButton(text: "Login",
      onPress: () async {
      showLoading(context);
      await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        showMessage(context,"Please try again later", title: "Error",negText: "cancel",posText: "ok");
      },


    );
  }
}
