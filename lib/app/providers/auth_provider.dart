import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:wallet/app/models/user_model.dart';
import 'package:wallet/app/utils/shared_preffs.dart';
import 'package:wallet/routing/routes.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('users');

  FirebaseAuth _auth;

  UserModel _userModel = UserModel();
  UserModel get userModel => _userModel;

  String _loginErrorMsg;
  String get loginErrorMsg => _loginErrorMsg;
  String _registerErrorMsg;
  String get registerErrorMsg => _registerErrorMsg;

  Future<void> registerUser({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    try {
      _registerErrorMsg = null;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userModel.name = name ?? '';
      _userModel.email = email ?? '';
      await addUserToFirestore(
        name: name,
        email: email,
        uid: _userModel.uid,
      );
      notifyListeners();
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _registerErrorMsg = errors[1];
    }
  }

  Future<void> loginUser({
    @required String email,
    @required String password,
  }) async {
    try {
      _loginErrorMsg = null;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('LOGIN USER:');
      print('TOKEN: ${_userModel.uid}');
      print('USER: ${_userModel.email}');
      await firestore.get().then((QuerySnapshot value) {
        // ignore: avoid_function_literals_in_foreach_calls
        value.docs.forEach((QueryDocumentSnapshot e) {
          if (e.data()['email'] == email) {
            _userModel = UserModel.fromDocument(e.data());
          }
        });
      });
      notifyListeners();
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _loginErrorMsg = errors[1];
    }
  }

  Future<void> addUserToFirestore({
    @required String name,
    @required String email,
    @required String uid,
  }) async {
    try {
      Map<String, dynamic> user = <String, dynamic>{
        'name': name ?? '',
        'email': email ?? '',
        'userToken': uid ?? '',
        'userID': '',
      };
      final DocumentReference doc = await firestore.add(user);
      _userModel.firestoreID = doc.id;
      Map<String, dynamic> userFinal = <String, dynamic>{
        'name': name ?? '',
        'email': email ?? '',
        'userToken': uid ?? '',
        'userID': doc.id ?? '',
      };
      await firestore.doc(doc.id).update(userFinal);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    try {
      await _auth.signOut();
      await SharedPreffs().deleteKeysUserLogout();
      Navigator.of(context).pushNamed(SignIn);
      print('User =======> logout');
    } catch (e) {
      print(e);
    }
  }
}
