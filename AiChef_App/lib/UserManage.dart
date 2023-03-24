import 'package:aichef_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserManage{
  late CollectionReference dbCollection = FirebaseFirestore.instance.collection("User");



  List<UserModel> fetchAllUser(){
    List<UserModel> users = [];
    QuerySnapshot querySnapshot = dbCollection.get() as QuerySnapshot<Object?>;
    querySnapshot.docs.forEach((doc) {
      users.add(UserModel.fromFirestore(doc));
    });
    return users;
  }

  UserModel fetchUser(String mobile){
    UserModel currentUser = UserModel(username: "null", phone: "null");
    return currentUser;
  }

  registerUser(UserModel user){

  }
}