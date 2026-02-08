import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/widgets/app_button.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogo),
              const SizedBox(height: 12),

              Image.asset(
                'assets/images/onboarding1_image.png',
                height: 280,
              ),

              const SizedBox(height: 12),

              Text(
                'Personalize Your Experience',
                style: AppStyles.black20SemiBold,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 8),

              Text(
                'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                style: AppStyles.gray14Regular,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Language', style: AppStyles.black16Medium),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  _selectorButton(text: 'English', isSelected: true),
                  const SizedBox(width: 12),
                  _selectorButton(text: 'Arabic', isSelected: false),
                ],
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Theme', style: AppStyles.black16Medium),
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  _themeButton(icon: Icons.wb_sunny_outlined, isSelected: true),
                  const SizedBox(width: 12),
                  _themeButton(icon: Icons.nightlight_round, isSelected: false),
                ],
              ),

              const SizedBox(height: 12),
              AppButton(
                text: 'Let’s start',
                onPress: () {
                  Navigator.push(context, AppRoutes.onboarding2 );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectorButton({required String text, required bool isSelected}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.blue),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: isSelected
              ? AppStyles.white14SemiBold
              : AppStyles.blue14SemiBold,
        ),
      ),
    );
  }

  Widget _themeButton({required IconData icon, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.blue),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : AppColors.blue,
      ),
    );
  }
}
