import 'package:get_storage/get_storage.dart';

class AppStorage {
  static GetStorage? storage = GetStorage();

  static const String keyAccessToken = 'token';
  static const String username = 'email';
  static const String password = 'password';
  static const String isloggedin = 'isloggedin';

////////////////////functions to write data/////////////////////////////

  static void saveAccessToken(dynamic value) {
    AppStorage.storage?.write(keyAccessToken, value);
  }

  static void saveIsLoggedin(dynamic value) {
    AppStorage.storage?.write(isloggedin, value);
  }

  static void saveUsername(dynamic value) {
    AppStorage.storage?.write(username, value);
  }

  static void savePassword(dynamic value) {
    AppStorage.storage?.write(password, value);
  }

  ////////////////////Function to read data/////////////////////////////

  static String? get readAccessToken {
    return storage?.read(keyAccessToken);
  }

  static bool? get readIsLoggedIn {
    return storage?.read(isloggedin);
  }

  static String? get readUsername {
    return storage?.read(username);
  }

  static String? get readPassword {
    return storage?.read(password);
  }

  ////////////////////Function to remove data/////////////////////////////
  static void removeStorage() {
    AppStorage.storage?.remove(keyAccessToken);
    AppStorage.storage?.remove(isloggedin);
    AppStorage.storage?.remove(username);
    AppStorage.storage?.remove(password);
  }
}
