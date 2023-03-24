import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? user_id;
  final String username;
  final String phone;

  const UserModel({
   this.user_id,
   required this.username,
   required this.phone,
  });

  //convert firestore database to jason
  // toJason(){
  //   return{
  //     "username": username,
  //     "phone": phone
  //   };
  // }

  factory UserModel.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data() as Map<String, dynamic>;
    return UserModel(
      user_id: doc.id,
      username: data['username'] ?? '',
      phone: data['phone'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore(){
    return {
      'username': username,
      'phone': phone
    };
  }

  @override
  String toString() {
    return '{id: $user_id, username: $username, phone: $phone }';
  }

//map user fetched from firebase to UserModel
  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, String>> document){
  //   var data = document.data();
  //   return UserModel(
  //     user_id: document.id,
  //     username: data!["username"] as String,
  //     phone: data["phone"] as String,
  //   );
  // }

}