import 'package:evently/ui/model/user_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_dialogs.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/ui/widgets/app_button.dart';
import 'package:evently/ui/widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../firebase_utils/firestore_utility.dart';
import '../../utils/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Image.asset(AppAssets.appLogo),
                  SizedBox(height: 20),
                  Text("Create your account", style: AppStyles.blue24SemiBold),
                  SizedBox(height: 25),
                  AppTextField(
                    hint: "Enter your name",
                    prefixIcon: Image.asset(AppAssets.icPerson),
                    controller: nameController,
                    validator: (text){
                      if(text?.isEmpty ==true) return "Please enter vaild name";
                      return null;
                    },
                  ),
                  SizedBox(height: 14),
                  AppTextField(
                    hint: "Enter your address",
                    prefixIcon: Icon(Icons.house_siding, color: AppColors.gray3),
                    controller: addressController,
                    validator: (text){
                      if(text?.isEmpty ==true) return "Please enter vaild address";
                      return null;
                    },
                  ),
                  SizedBox(height: 14),
                  AppTextField(
                    hint: "Enter your phone number",
                    prefixIcon: Icon(Icons.phone_android, color: AppColors.gray3),
                    controller: phoneNumberController,
                    validator: (text){
                      if(text?.isEmpty ==true || text!.length < 11) return "Please enter vaild phone number";
                      return null;
                    },
                  ),
                  SizedBox(height: 14),
                  AppTextField(
                    hint: "Enter your email",
                    prefixIcon: Image.asset(AppAssets.icEmail),
                    controller: emailController,
                    validator: (text){
                      if(text?.isEmpty ==true) return "Please enter vaild email";
                      var isValid=RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text!);
                      if(!isValid) return "This email is invalid form";
                      return null;
                    },
                  ),
                  SizedBox(height: 14),
                  AppTextField(
                    hint: "Enter your password",
                    prefixIcon: Image.asset(AppAssets.icLock),
                    suffixIcon: Image.asset(AppAssets.icEyeClosed),
                    isPasswordField: true,
                    controller: passwordController,
                    validator: (text){
                      if(text?.isEmpty ==true || text== null) return "Please enter vaild password";
                       if(text.length<6){
                         return "Your password is weak";
                       }
                       return null;
                    },
                  ),
                  SizedBox(height: 14),
                  AppTextField(
                    hint: "Confirm your password",
                    prefixIcon: Image.asset(AppAssets.icLock),
                    suffixIcon: Image.asset(AppAssets.icEyeClosed),
                    isPasswordField: true,
                    validator: (text){
                      if(text?.isEmpty ==true || text== null) return "Please enter vaild password";
                      if(text!=passwordController.text){
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  buildRegisterButton(context),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style: AppStyles.gray14Regular,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, AppRoutes.loginScreen);
                        },
                        child: Text(
                          "Login",
                          style: AppStyles.blue14SemiBold.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.blue,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Or",
                    style: AppStyles.blue18Medium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  AppButton(
                    text: "Sign up with Google",
                    onPress: () {},
                    backgroundColor: AppColors.white,
                    textStyle: AppStyles.blue18Medium,
                    icon: Image.asset(AppAssets.icGmail),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  AppButton buildRegisterButton(BuildContext context) {
    return AppButton(
      text: "Sign up",
      onPress: () async {
        if(!formKey.currentState!.validate()) return;
        try {
          showLoading(context);
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
          UserDm.currentUser = UserDm(
            id: credential.user!.uid,
            address: addressController.text,
            phoneNumber: phoneNumberController.text,
            name: nameController.text,
            email: emailController.text,
          );
          createUserInFirestore(UserDm.currentUser!);
          Navigator.pop(context);
          Navigator.push(context, AppRoutes.navigationScreen);
        } on FirebaseAuthException catch (e) {
          Navigator.pop(context);
          var message = "";
          if (e.code == 'weak-password') {
            message = "The password provided is too weak.";
          } else if (e.code == 'email-already-in-use') {
            message = "The account already exists for that email.";
          } else {
            message = e.message ?? AppConstants.defaultErrorMessage;
          }
          showMessage(context, message, title: "Error", posText: "ok");
        } catch (e) {
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
