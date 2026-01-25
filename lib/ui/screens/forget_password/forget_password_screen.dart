import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget{
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: AppColors.offWhite,
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           children: [
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, AppRoutes.loginScreen);
                   },
                   child: Icon(
                       Icons.arrow_back_ios,
                       color: AppColors.blue,
                       size: 22,

                     ),
                 ),
                 Text("Forget Password",style: AppStyles.black20Medium,),
                 SizedBox(width: 32,height: 32,),
             ],),
             SizedBox(height: 60,),
             SizedBox(
               height: MediaQuery.of(context).size.height* 0.42,
               width: MediaQuery.of(context).size.width* 0.91,
               child:Image.asset(AppAssets.forgetPassword,fit: BoxFit.cover,) ,
             ),
             SizedBox(height: 50,),
             AppButton(text: "Reset password", onPress: (){},)
           ],
         ),
       ),
     ),
   );
  }

}
