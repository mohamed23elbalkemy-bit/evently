class UserDm {
  static UserDm? currentUser;
  static const collectionName = "users";
  String id;
  String name;
  String address;
  String phoneNumber;
  String email;
  List<String> favoriteEvents;

  UserDm({
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.name,
    required this.email,
    this.favoriteEvents = const [],
  });

  static UserDm fromJson(Map<String, dynamic> json) {
    List<dynamic> favorites = json["favoriteEventIds"];
    return UserDm(
      id: json["id"],
      address: json["address"],
      phoneNumber: json["phone_number"],
      name: json["name"],
      email: json["email"],
      favoriteEvents:favorites.map((id) => id.toString()).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "phone_number": phoneNumber,
      "email": email,
      "favorites": favoriteEvents,
    };
  }
}
