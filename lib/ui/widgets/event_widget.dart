import 'package:evently/ui/event_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget{
  final EventDm eventDm;

  EventWidget({super.key,required this.eventDm});
  @override
  Widget build(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height* 0.23,
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(eventDm.category.imagePath)),
    borderRadius: BorderRadius.circular(16),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(eventDm.category.imagePath,
            fit: BoxFit.fill,
            height: double.infinity,width: double.infinity,),
        ),
        Column(
          children: [
          buildDateContainer(),
          SizedBox(height: 60,),
          buildTitleContainer(),
        ],
        ),
      ],
    )
  ,);
  }

  buildDateContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.offWhite
        ),
        child: Text("${eventDm.dateTime.day} Jan",style: AppStyles.blue14SemiBold,),
      ),
    );
  }
  buildTitleContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(child: Text(eventDm.title,style: AppStyles.black14Medium,)),
        Icon(eventDm.isFavorite ? Icons.favorite:Icons.favorite_border,color: AppColors.blue,),
      ],),
    );
  }
 }