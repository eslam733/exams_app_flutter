import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/cupertino.dart';

import '../../../../model/student_model.dart';

class LoginStudetProvider extends ChangeNotifier {
  Future<bool> loginGoogle() async {
    await PublicProviders.googleLoginProvider.googleLogin();
    return await PublicProviders.googleLoginProvider.ifLogin();
  }

  updateUserData() async {
    CollectionReference<Map<String, dynamic>> users =
        (FirebaseFirestore.instance.collection('users'));
    QuerySnapshot<Map<String, dynamic>> snapshotUsers = await users.get();

    bool ifExists = false;
    String refId = '';
    for (var element in snapshotUsers.docs) {
      if (element['email'] == PublicProviders.googleLoginProvider.user!.email) {
        ifExists = true;
        refId = element.id;
      }
    }
    StudentModel studentModel = StudentModel(
      email: PublicProviders.googleLoginProvider.user!.email,
      name: PublicProviders.googleLoginProvider.user!.displayName ?? "",
      image: PublicProviders.googleLoginProvider.user!.photoUrl ?? "",
      id: PublicProviders.googleLoginProvider.user!.id,
    );
    if (ifExists) {
      await users
          .doc(refId)
          .set(studentModel.toJson(), SetOptions(merge: true));
    } else {
      studentModel.score = 0;
      await FirebaseFirestore.instance
          .collection('users')
          .add(studentModel.toJson());
    }
  }
}
