import 'dart:async';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/screens/onboarding/onboarding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context, AppRoutes.onboarding1 );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                AppAssets.appLogo,
                width: 500,
              ),
            ),

            const Spacer(),

            Column(
              children: [
                Text(
                  'ROUTE',
                  style: AppStyles.blue24SemiBold
                ),
                const SizedBox(height: 6),
                Text(
                  'Supervised by Mohamed Nabil',
                  style: AppStyles.gray14Regular
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
