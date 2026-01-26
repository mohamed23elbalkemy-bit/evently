import 'package:evently/ui/event_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:evently/ui/widgets/app_button.dart';
import 'package:evently/ui/widgets/categories_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/app_text_field.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  CategoryDM selectedCategory = AppConstants.customCategories[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.offWhite,
            title: Text("Add event", style: AppStyles.black18Medium),
            centerTitle: true,
          ),
          backgroundColor: AppColors.offWhite,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Expanded(
                child: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Image.asset(
                    selectedCategory.imagePath,
                    height: MediaQuery.of(context).size.height * .24,
                  ),
                  SizedBox(height: 8),
                  CategoriesTabBar(
                    categories: AppConstants.customCategories,
                    onChanged: (selectedIndex) {
                      this.selectedCategory = selectedIndex;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Title",
                    style: AppStyles.black16Medium,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8),
                  AppTextField(hint: "Event Title"),
                  SizedBox(height: 8),
                  Text(
                    "Description",
                    style: AppStyles.black16Medium,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8),
                  AppTextField(hint: "Event Description....", minLines: 3),
                  SizedBox(height: 12),
                  buildChooseDateRow(),
                  SizedBox(height: 8),
                  buildChooseTimeRow(),
                ],),),
              ),
                buildAddEventButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildChooseDateRow() {
    return Row(
      children: [
        Icon(Icons.calendar_month, color: AppColors.blue, size: 24),
        SizedBox(width: 8),
        Text("Event Date", style: AppStyles.black16Medium),
        Text(" ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
        Spacer(),
        InkWell(
          onTap: () async {
            selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              initialDate: selectedDate
            ) ?? selectedDate;
            setState(() {});
          },
          child: Text(
            "Choose date",
            style: AppStyles.blue14Regular.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  buildChooseTimeRow() {
    return Row(
      children: [
        Icon(Icons.access_time, color: AppColors.blue, size: 24),
        SizedBox(width: 8),
        Text("Event Time", style: AppStyles.black16Medium),
        Text(" ${selectedTime.hour}:${selectedTime.minute}"),
        Spacer(),
        InkWell(
          onTap: () async{
            selectedTime= await showTimePicker(context: context, initialTime: selectedTime) ?? selectedTime;
            setState(() {});
          },
          child: Text(
            "Choose time",
            style: AppStyles.blue14Regular.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  buildAddEventButton() {
    return AppButton(text: "Add event", onPress: (){});
  }
}
