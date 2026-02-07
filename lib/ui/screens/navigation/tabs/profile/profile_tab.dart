import 'package:evently/ui/model/user_dm.dart';
import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_styles.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    if (UserDm.currentUser == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            child: Image.asset(AppAssets.routeLogoDark),
            minRadius: 80,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 12),
          Text(UserDm.currentUser!.name, style: AppStyles.black20Medium),
          SizedBox(height: 12),
          Text(UserDm.currentUser!.email, style: AppStyles.black16Medium),
          SizedBox(height: 12),
          buildThemeRow(),
          buildLanguageRow(),
          buildLogoutRow(),
        ],
      ),
    );
  }

  buildThemeRow() {
    return Container();
  }

  late LanguageProvider provider;
  buildLanguageRow() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          Text("Language"),
          Spacer(),
          Switch(
            value: LanguageProvider.currentLocale == "ar",
            onChanged: (value) {
              provider.updateLocale(value ? "ar" : "en");
            },
          ),
        ],
      ),
    );
  }

  buildLogoutRow() {
    return Container();
  }
}
