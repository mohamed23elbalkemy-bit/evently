import 'package:evently/ui/model/event_dm.dart';
import 'package:flutter/material.dart';

import '../../../../../firebase_utils/firestore_utility.dart';
import '../../../../model/user_dm.dart';
import '../../../../widgets/event_widget.dart';
class FavoriteTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFavoriteEventsForUser(UserDm.currentUser!.id),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else if(snapshot.hasData){
            var events=snapshot.data!;
            // events.where((event){
            // return UserDm.currentUser!.favoriteEvents.contains(event.id);
            // });
            return Expanded(
              child: Column(
                children: [
                  buildEventsList(snapshot.data!)
                ],),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }

        });
  }
  buildEventsList(List<EventDm> events) {
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventWidget(eventDm: events[index]);
        },
      ),
    );
  }
}