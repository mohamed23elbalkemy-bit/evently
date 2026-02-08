import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                'assets/images/onboarding3_image.png',
                height: 300,
              ),

              const SizedBox(height: 40),

              Text(
                'Effortless Event Planning',
                style: AppStyles.black20SemiBold,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 12),

              Text(
                'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
                style: AppStyles.gray14Regular,
                textAlign: TextAlign.start,
              ),

              const Spacer(),

              AppButton(
                text: 'Next',
                onPress: () {
                  Navigator.push(context, AppRoutes.onboarding4);
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
