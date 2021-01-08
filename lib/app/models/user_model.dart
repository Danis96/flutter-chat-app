class UserModel {
  UserModel({
    this.email,
    this.name,
    this.uid,
    this.firestoreID,
  });

  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      email: doc['email'] as String ?? '',
      uid: doc['userID'] as String ?? '',
      name: doc['name'] as String ?? '',
    );
  }

  String email;
  String name;
  String uid;
  String firestoreID;
}
