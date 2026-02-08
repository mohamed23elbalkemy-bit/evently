import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 12,),
              _header(context),

              const SizedBox(height: 24),

              Image.asset(
                'assets/images/onboarding4_image.png',
                height: 300,
              ),

              const SizedBox(height: 40),

              Text(
                'Connect with Friends & Share Moments',
                style: AppStyles.black20SemiBold,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 12),

              Text(
                'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
                style: AppStyles.gray14Regular,
                textAlign: TextAlign.start,
              ),

              const Spacer(),

              AppButton(
                text: 'Get started',
                onPress: () {
                  Navigator.push(context,  AppRoutes.loginScreen );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.blue,),
          onPressed: () => Navigator.pop(context),
        ),
        Image.asset(AppAssets.appLogo),
        TextButton(onPressed: () {
          Navigator.pushReplacement(context, AppRoutes.loginScreen);
        }, child: Text('Skip',style: AppStyles.blue18Medium,)),
      ],
    );
  }
}
