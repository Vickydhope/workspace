import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/features/auth/data/model/user_model.dart';

@injectable
class SharedPreferencesService {
  static const String keyAppLanguages = 'languages';
  static const String keyDarkMode = 'dark-mode';
  static const String loginStatus = 'login_status';

  static const keyUser = 'user';

  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  bool get darkMode => _getFromPrefs(keyDarkMode) ?? false;

  set darkMode(bool value) => _saveToPrefs(keyDarkMode, value);

  bool get isLogin => user != null && user!.id > 0;

  UserModel? get user {
    final userJson = _getFromPrefs(keyUser);

    if (userJson == null) return null;

    return UserModel.fromJson(userJson);
  }

  set user(UserModel? userToSave) {
    _saveToPrefs(keyUser, userToSave);
  }

  void _saveToPrefs<T>(String key, T content) {
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  dynamic _getFromPrefs(String key) {
    var value = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }
}
