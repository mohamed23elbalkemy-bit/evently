import 'package:evently/ui/screens/navigation/tabs/favorite/favorite_tab.dart';
import 'package:evently/ui/screens/navigation/tabs/home/home_tab.dart';
import 'package:evently/ui/screens/navigation/tabs/settings/settings_tab.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
class _NavigationScreenState extends State<NavigationScreen> {
  var selectedIndex=0;
  var tabs =[HomeTab(),FavoriteTab(),SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: tabs[selectedIndex],
        floatingActionButton: buildFloatingActionButton (),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: (){},
      shape:CircleBorder(),
      child: Icon(Icons.add,color: AppColors.white,),
      backgroundColor: AppColors.blue,);
  }

  Widget buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.white),
      child: BottomNavigationBar(
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.gray2,
          currentIndex: selectedIndex,
          onTap: (newIndex){
            selectedIndex=newIndex;
            setState(() {});
          },
          items: [
        buildBottomNavigationBarItem(Icons.home,"Home"),
        buildBottomNavigationBarItem(Icons.favorite_border,"Favorite"),
        buildBottomNavigationBarItem(Icons.person,"Profile")
      ]),
    );
  }

  buildBottomNavigationBarItem(IconData iconData, String lable) {
    return BottomNavigationBarItem(
        icon: Icon(iconData),
        label: lable,

    );
  }
}
