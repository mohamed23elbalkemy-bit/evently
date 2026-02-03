import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/firebase_utils/firestore_utility.dart';
import 'package:evently/ui/model/event_dm.dart';
import 'package:evently/ui/model/user_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  final EventDm eventDm;

  EventWidget({super.key, required this.eventDm});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.eventDm.category.imagePath),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.eventDm.category.imagePath,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            children: [
              buildDateContainer(),
              SizedBox(height: 60),
              buildTitleContainer(),
            ],
          ),
        ],
      ),
    );
  }

  buildDateContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.offWhite,
        ),
        child: Text(
          "${widget.eventDm.dateTime.day} Jan",
          style: AppStyles.blue14SemiBold,
        ),
      ),
    );
  }

  buildTitleContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(widget.eventDm.title, style: AppStyles.black14Medium),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("userDM").doc(UserDm.currentUser!.id).snapshots() ,
            builder: (context,snapshot){
              return InkWell(
                onTap: () {
                  if (UserDm.currentUser!.favoriteEvents.contains(
                    widget.eventDm.id,
                  )) {
                    removeEventFromFavorite(widget.eventDm.id, UserDm.currentUser!);
                  } else {
                    addEventToFavorite(widget.eventDm.id, UserDm.currentUser!);
                  }
                },
                child: Icon(
                  UserDm.currentUser!.favoriteEvents.contains(widget.eventDm.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: AppColors.blue,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}