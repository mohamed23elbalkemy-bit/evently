import 'package:evently/ui/event_dm.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesTabBar extends StatefulWidget {
  final List<CategoryDM> categories;
  final Function(CategoryDM) onChanged;


  const CategoriesTabBar({super.key,required this.categories,required this.onChanged,});

  @override
  State<CategoriesTabBar> createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar> {
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.categories.length ,
        child: TabBar(
          tabAlignment: TabAlignment.start,
            indicatorColor: Colors.transparent,
            onTap: (index){
              selectedIndex=index;
              widget.onChanged(widget.categories[index]);
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.categories.map(mapCategoryToWidget).toList()));
  }

  Widget mapCategoryToWidget(CategoryDM category){
    bool isSelected= selectedIndex==widget.categories.indexOf(category);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue : AppColors.white ,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [
        Icon(category.icon,color: isSelected ? AppColors.white : AppColors.blue,),
        SizedBox(width: 8,),
        Text(category.name,style: isSelected ? AppStyles.white18Medium : AppStyles.black18Medium,)
      ],),
    );
  }
}