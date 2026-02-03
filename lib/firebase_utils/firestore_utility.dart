import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/ui/model/event_dm.dart';

import '../ui/model/user_dm.dart';


Future<void> createUserInFirestore(UserDm user) async {
  var userCollection = FirebaseFirestore.instance.collection("users");
  var emptyDoc = userCollection.doc(user.id);
  emptyDoc.set(user.toJson());
}

Future<UserDm> getUserFromFirestore(String uId)async{
  var userCollection = FirebaseFirestore.instance.collection("users");
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
  CollectionReference collection = FirebaseFirestore.instance.collection("events");
  Stream<QuerySnapshot> stream =   collection.snapshots();
  return stream.map((querySnapshot){
    return querySnapshot.docs.map((doc){
      var json = doc.data() as Map<String , dynamic>;
      return EventDm.fromJson(json);
    }).toList();
  });
}