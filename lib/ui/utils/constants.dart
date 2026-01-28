import 'package:evently/ui/model/event_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

abstract final class AppConstants {
static const defaultErrorMessage="Something went wrong please try again later";

static CategoryDM all=CategoryDM(name: "all", icon: Icons.border_all_rounded, imagePath: "");
static  CategoryDM sports=CategoryDM(name: "sports", icon: Icons.bike_scooter, imagePath: AppAssets.sportLight);
static  CategoryDM bookingClub=CategoryDM(name: "bookingClub", icon: Icons.menu_book, imagePath: AppAssets.bookClubLight);
static  CategoryDM birthday=CategoryDM(name: "birthday", icon: Icons.cake_outlined, imagePath: AppAssets.birthdayLight);
static  CategoryDM meeting=CategoryDM(name: "meeting", icon: Icons.meeting_room, imagePath: AppAssets.meetingLight);
static  CategoryDM exhibition=CategoryDM(name: "exhibition", icon: Icons.access_time_filled_rounded, imagePath: AppAssets.exhibitionLight);


  static List<CategoryDM> allCategories=[all,sports,bookingClub,birthday,meeting,exhibition];
  static List<CategoryDM> customCategories=[sports,bookingClub,birthday,meeting,exhibition];

}

