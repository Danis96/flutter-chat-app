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
  String _addUserErrorMsg;
  String get addUserErrorMsg => _addUserErrorMsg;
  String _updateUserErrorMsg;
  String get updateUserErrorMsg => _updateUserErrorMsg;

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
      // get user by email
      getUserDataByEmail(email: email, isLogin: true).then(
        (_) => notifyListeners(),
      );
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
      _addUserErrorMsg = null;
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
      _userModel = UserModel.fromDocument(user);
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _addUserErrorMsg = errors[1];
    }
  }

  Future<void> updateUser({
    @required String email,
    @required String name,
    @required String userID,
  }) async {
    try {
      _updateUserErrorMsg = null;
      Map<String, dynamic> user = <String, dynamic>{
        'email': email ?? '',
        'name': name ?? '',
        'userID': userID ?? '',
        'userToken': _userModel.uid ?? '',
      };
      await firestore.doc(userID).update(user);
      _userModel = UserModel.fromDocument(user);
      notifyListeners();
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _updateUserErrorMsg = errors[1];
    }
  }

  Future<void> getUserDataByEmail(
      {@required String email, bool isLogin}) async {
    try {
      await firestore.get().then((QuerySnapshot value) {
        // ignore: avoid_function_literals_in_foreach_calls
        value.docs.forEach((QueryDocumentSnapshot e) {
          if (e.data()['email'] == email) {
            _userModel = UserModel.fromDocument(e.data());
          }
        });
      });
      if (!isLogin) {
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getInitialUserData({
    @required TextEditingController emailController,
    @required TextEditingController nameController,
  }) async {
    if (_userModel.name != null || _userModel.name.isNotEmpty) {
      nameController.text = _userModel.name;
    }
    if (_userModel.email != null || _userModel.email.isNotEmpty) {
      emailController.text = _userModel.email;
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
