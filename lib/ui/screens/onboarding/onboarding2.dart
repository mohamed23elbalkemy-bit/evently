import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _header(context),

              const SizedBox(height: 24),

              Image.asset(
                'assets/images/onboarding2_image.png',
                height: 300,
              ),

              const SizedBox(height: 40),

              Text(
                'Find Events That Inspire You',
                style: AppStyles.black20SemiBold,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 12),

              Text(
                'Dive into a world of events crafted to fit your unique interests. Whether you are into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
                style: AppStyles.gray14Regular,
                textAlign: TextAlign.start,
              ),

              const Spacer(),

              AppButton(
                text: 'Next',
                onPress: () {
                  Navigator.push(context, AppRoutes.onboarding3 );
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
        const SizedBox(width: 40),
        Image.asset(AppAssets.appLogo),
        TextButton(onPressed: () {
          Navigator.pushReplacement(context, AppRoutes.loginScreen);
        }, child: Text('Skip',style: AppStyles.blue18Medium,)),
      ],
    );
  }
}
