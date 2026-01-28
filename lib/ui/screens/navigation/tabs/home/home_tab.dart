import 'package:evently/ui/model/event_dm.dart';
import 'package:evently/ui/model/user_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/utils/constants.dart';
import 'package:evently/ui/widgets/categories_tab_bar.dart';
import 'package:evently/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        buildHeader(),
        buildCategoriesTabBar(),
        buildEventsList(),
      ],
      ),
    );
  }
  buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Text("Welcome Back ✨",style: AppStyles.gray18Regular,),
          Spacer(),
          Image.asset(AppAssets.icLD,width: 24,height: 24,),
          SizedBox(width: 8,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.blue,
            ),
            child:Text("EN",style: AppStyles.white14SemiBold),
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
          )
        ],),
        Text(UserDm.currentUser!.name,style: AppStyles.black20Medium,textAlign: TextAlign.start,),
      ],
    );
  }

  buildCategoriesTabBar() {
    return CategoriesTabBar(
      categories: AppConstants.allCategories,
      onChanged: (category) {

      }

    );
  }

  buildEventsList(){
    return Expanded(
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context,index){
            var category = CategoryDM(name: "Sports", icon: Icons.bike_scooter, imagePath: AppAssets.sportLight);
            var eventDm = EventDm(ownerId:"", category: category, dateTime: DateTime.now(), title: "Meeting for Updating The Development Method", description: "" );
            return  EventWidget(eventDm:eventDm,);
          }),
    );
  }

}
