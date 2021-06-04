import 'package:shared_preferences/shared_preferences.dart';

class MyCache {
  static SharedPreferences instance;

  static init() async {
    instance ??= await SharedPreferences.getInstance();
  }

  static putString(key, value) async {
    await init();
    print('putting string : ' + key + ' as ' + value.toString());
    await instance.setString(key, value);
  }

  static getString(key) async {
    await init();
    final value = instance.getString(key);
    return value ?? '';
  }

  static putBool(key, value) async {
    await init();
    //print(key + value.toString());
    await instance.setBool(key, value);
  }

  static Future getBool(key) async {
    await init();
    return instance.getBool(key);
  }

  static putArray(key, List<dynamic> array) async {
    await init();
    await instance.setStringList(
        key,
        array.map((item) {
          return item.toString();
        }).toList());
  }

  static getArray<T>(key) async {
    await init();
    instance.getStringList(key).map((item) {
      return item as T;
    });
  }

  static clear() async {
    await init();
    await instance.clear();
  }
}

//those keys to unifide cache strings and make them dynamic on changing
class MyCacheKeys {
  static const ID = 'ID';
  static const EMAIL = 'EMAIL';
  static const FULL_NAME = 'FULL_NAME';
  static const TOKEN = 'TOKEN';
  static const VARIFIED = 'VARIFIED';
  static const PHOTO = 'PHOTO';
  static const LOCALE = 'LOCALE';
  static const THEME = 'THEME';
}

// ex: MyCache.getString(MyCacheKeys.TOKEN)
