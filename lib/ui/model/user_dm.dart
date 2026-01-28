class UserDm {
  static UserDm? currentUser;
  String id;
  String name;
  String address;
  String phoneNumber;
  String email;
  List<String> favoriteEvents;

  UserDm({required this.id,required this.address,required this.phoneNumber,required this.name,required this.email,this.favoriteEvents=const[]});
}