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
