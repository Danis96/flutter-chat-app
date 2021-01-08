import 'package:shared_preferences/shared_preferences.dart';

class SharedPreffs {
  // write email in shared preffs
  Future<void> writeEmailInShared(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  // read email from shared
  Future<String> readEmailFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  // write name in shared preffs
  Future<void> writeNameInShared(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  // read name from shared
  Future<String> readNameFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  // write doc id in shared preffs
  Future<void> writeDocIdInShared(String docID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('doc_id', docID);
  }

  // read name from shared
  Future<String> readDocIdFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('doc_id') ?? '';
  }

  Future<void> setFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_run', false);
  }

  Future<bool> isFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_run') ?? true;
  }

  // delete email key if user logg out
  Future<void> deleteKeysUserLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
