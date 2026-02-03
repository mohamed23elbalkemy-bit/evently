import 'package:evently/firebase_utils/firestore_utility.dart';
import 'package:evently/ui/model/event_dm.dart';
import 'package:evently/ui/model/user_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/utils/constants.dart';
import 'package:evently/ui/widgets/categories_tab_bar.dart';
import 'package:evently/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<EventDm> events=[];
  List<EventDm> filteredEvents=[];
  var selectedCategory = AppConstants.allCategories[0];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildHeader(),
          StreamBuilder(stream: getEventsFromFirestore(),
              builder: (context,snapshot){
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }else if(snapshot.hasData){
              events= snapshot.data!;
              filterEvents();
              return Expanded(
                child: Column(
                  children: [
                    buildCategoriesTabBar(),
                    buildEventsList()
                  ],),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }

          }),
         ],
      ),
    );
  }

  buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text("Welcome Back ✨", style: AppStyles.gray18Regular),
            Spacer(),
            Image.asset(AppAssets.icLD, width: 24, height: 24),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.blue,
              ),
              child: Text("EN", style: AppStyles.white14SemiBold),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            ),
          ],
        ),
        Text(
          UserDm.currentUser!.name,
          style: AppStyles.black20Medium,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  buildCategoriesTabBar() {
    return CategoriesTabBar(
      categories: AppConstants.allCategories,
      onChanged: (category) {
      selectedCategory =category;
      setState(() {});
      },
    );
  }

  void filterEvents() {
     if(selectedCategory != AppConstants.all){
      filteredEvents = events.where((event){
        return event.category.name == selectedCategory.name;
      }).toList();
      }else{
      filteredEvents=events;
    }

  }

  buildEventsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredEvents.length,
        itemBuilder: (context, index) {
          return EventWidget(eventDm: filteredEvents[index]);
        },
      ),
    );
  }

}
