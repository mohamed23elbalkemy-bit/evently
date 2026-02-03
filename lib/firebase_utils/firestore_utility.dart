import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/ui/model/event_dm.dart';

import '../ui/model/user_dm.dart';


Future<void> createUserInFirestore(UserDm user) async {
  var userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
  var emptyDoc = userCollection.doc(user.id);
  emptyDoc.set(user.toJson());
}

Future<UserDm> getUserFromFirestore(String uId)async{
  var userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
  DocumentSnapshot snapshot = await userCollection.doc(uId).get();
  Map<String,dynamic> json =snapshot.data() as Map<String,dynamic>;
  return UserDm.fromJson(json);
}

createEventInFirestore(EventDm event) async {
  CollectionReference collection = FirebaseFirestore.instance.collection(
    "events",
  );
  var documentRef = collection.doc(); // create empty document
  event.id= documentRef.id ;

  await documentRef.set(event.toJson(event));
}

Stream<List<EventDm>> getEventsFromFirestore(){
  CollectionReference collection = FirebaseFirestore.instance.collection(UserDm.collectionName);
  Stream<QuerySnapshot> stream =   collection.snapshots();
  return stream.map((querySnapshot){
    return querySnapshot.docs.map((doc){
      var json = doc.data() as Map<String , dynamic>;
      return EventDm.fromJson(json);
    }).toList();
  });
}

addEventToFavorite(String eventId,UserDm user){
  CollectionReference userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName,);
  var docRef = userCollection.doc(user.id);
  List<String> favoriteEvents = List.of(user.favoriteEvents);
  favoriteEvents.add(eventId);
  user.favoriteEvents = favoriteEvents;
  docRef.update({
    "favoriteEventIds" : favoriteEvents
  });
}

removeEventFromFavorite(String eventId,UserDm user){
  CollectionReference userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName,);
  var docRef = userCollection.doc(user.id);
  user.favoriteEvents.remove(eventId);
  docRef.update({
    "favoriteEventIds" : user.favoriteEvents
  });
}

Future <List<EventDm>> getFavoriteEventsForUser(String uid) async {
  if(UserDm.currentUser!.favoriteEvents.isEmpty) return [];
  CollectionReference eventCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
  QuerySnapshot querySnapshot = await eventCollection.where("id",whereIn: UserDm.currentUser!.favoriteEvents).get();
    return querySnapshot.docs.map((doc){
      var json = doc.data() as Map<String , dynamic>;
      return EventDm.fromJson(json);
    }).toList();
}