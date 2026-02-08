import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/model/user_dm.dart';
import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_dialogs.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:evently/ui/utils/constants.dart';
import 'package:evently/ui/widgets/app_button.dart';
import 'package:evently/ui/widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../firebase_utils/firestore_utility.dart';
import '../../utils/app_styles.dart';
import 'google_auth_service.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController =TextEditingController();
  final passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
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
                Text(localization.loginHeaderMessage, style: AppStyles.blue24SemiBold),
                SizedBox(height: 24),
                AppTextField(
                  hint: localization.emailHint,
                  isPasswordField: false,
                  prefixIcon: Image.asset(AppAssets.icEmail),
                  controller: emailController,
                ),
                SizedBox(height: 16),
                AppTextField(
                  hint: localization.passwordHint,
                  isPasswordField: true,
                  prefixIcon: Image.asset(AppAssets.icLock),
                  suffixIcon: Image.asset(AppAssets.icEyeClosed),
                  controller: passwordController,
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: (){
                    Navigator.push(context, AppRoutes.forGetPassword);
                  },
                  child: Text(
                    localization.forgetPassword,
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
                  Text(localization.dontHaveAccount,style: AppStyles.gray14Regular,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,AppRoutes.registerScreen);
                    },
                    child: Text(localization.signUp,style: AppStyles.blue14SemiBold.copyWith(decoration:TextDecoration.underline,decorationColor : AppColors.blue,
                      decorationThickness: 2,  ),),
                  )
                ],),
                SizedBox(height: 37),
                Text(localization.or,style: AppStyles.blue18Medium,textAlign: TextAlign.center,),
                SizedBox(height: 37),
                AppButton(
                  text: localization.googleLogin,
                  backgroundColor: AppColors.white,
                  textStyle: AppStyles.blue18Medium,
                  icon: Image.asset(AppAssets.icGmail),
                  onPress: () async {
                    showLoading(context);
                    try {
                      final credential =
                      await GoogleAuthService.signInWithGoogle();

                      if (credential == null) {
                        Navigator.pop(context);
                        return;
                      }

                      final firebaseUser = credential.user!;

                      final user = await addGoogleUserToFirestore(
                        uid: firebaseUser.uid,
                        email: firebaseUser.email ?? '',
                        name: firebaseUser.displayName ?? 'Google User',
                      );

                      UserDm.currentUser = user;

                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        AppRoutes.navigationScreen,
                      );
                    } catch (e) {
                      Navigator.pop(context);
                      showMessage(
                        context,
                        e.toString(),
                        title: "Error",
                        posText: "ok",
                      );
                    }
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  AppButton buildLoginButton() {
    return AppButton(text: AppLocalizations.of(context)!.login,
      onPress: () async {
      showLoading(context);
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        UserDm.currentUser = await getUserFromFirestore(credential.user!.uid);
        Navigator.pop(context);
        Navigator.push(context, AppRoutes.navigationScreen);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        var message="";
        if (e.code == 'user-not-found') {
          message="No user found for that email.";
        } else if (e.code == 'wrong-password') {
          message="Wrong password provided for that user.";
        }
        else{
          message=e.message ?? AppConstants.defaultErrorMessage;
        }
        showMessage(context, message , title: "Error",posText: "ok");
      }catch (e) {
        showMessage(
          context,
          AppConstants.defaultErrorMessage,
          title: "Error",
          posText: "ok",
        );
      }
      },



    );
  }
}
