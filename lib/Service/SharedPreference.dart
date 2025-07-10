import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

import '../Model/Login_Model.dart';

class SharedPrefs {
  final _getIt = GetIt.instance;
  SharedPreferences? _prefs;

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception("SharedPreferences has not been initialized.");
    }
    return _prefs!;
  }

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    _getIt.registerSingleton<SharedPrefs>(this);
  }

  Future<bool> setLoginData(LoginModel loginApi) async {
    Map<String, dynamic> api = loginApi.toJson();
    String encodedData = json.encode(api);
    final sharedPrefs = GetIt.instance<SharedPrefs>();
    final prefs = sharedPrefs.prefs;
    return await prefs.setString("loginData", encodedData);
  }

  Future<LoginModel?> getLoginData() async {
    final sharedPrefs = GetIt.instance<SharedPrefs>();
    final prefs = sharedPrefs.prefs;
    String? res = prefs.getString("loginData");
    if (res != null) {
      Map<String, dynamic> api = json.decode(res);
      LoginModel loginApiModel = LoginModel.fromJson(api);
      return loginApiModel;
    }
    return null;
  }

  Future<bool> removeLoginData() async {
    final sharedPrefs = GetIt.instance<SharedPrefs>();
    final prefs = sharedPrefs.prefs;
    bool done = await prefs.remove("loginData");
    return done;
  }

  Future<bool> setLoginCreds(Map<String, dynamic> loginCreds) async {
    String encodedData = json.encode(loginCreds);
    final sharedPrefs = GetIt.instance<SharedPrefs>();
    final prefs = sharedPrefs.prefs;
    return await prefs.setString("loginCreds", encodedData);
  }

  Future<Map<String, dynamic>?> getLoginCreds() async {
    final sharedPrefs = GetIt.instance<SharedPrefs>();
    final prefs = sharedPrefs.prefs;
    String? res = prefs.getString("loginCreds");
    if (res != null) {
      Map<String, dynamic> api = json.decode(res);
      return api;
    }
    return null;
  }

  Future<bool> removeLoginCreds() async {
    final sharedPrefs = GetIt.instance<SharedPrefs>();
    final prefs = sharedPrefs.prefs;
    bool done = await prefs.remove("loginCreds");
    return done;
  }
}

//
// class SharedPrefrence {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   Future<void> setSessionId(String sessionId) async {
//     final prefs = await _prefs;
//     await prefs.setString('chat_session_id', sessionId);
//   }
//
//   Future<String?> getSessionId() async {
//     final prefs = await _prefs;
//     return prefs.getString('chat_session_id');
//   }
//
//   Future<void> clearSessionId() async {
//     final prefs = await _prefs;
//     await prefs.remove('chat_session_id');
//   }
//
// // Existing methods like removeLoginData() stay here
// }
//
//
//
// class SharedPrefrence2 {
//   final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();
//
//   Future<void> setSessionId2(String sessionId) async {
//     final prefs = await _prefs2;
//     await prefs.setString('chat_session_id', sessionId);
//   }
//
//   Future<String?> getSessionId2() async {
//     final prefs = await _prefs2;
//     return prefs.getString('chat_session_id');
//   }
//
//   Future<void> clearSessionId2() async {
//     final prefs = await _prefs2;
//     await prefs.remove('chat_session_id');
//   }
//
// // Existing methods like removeLoginData() stay here
// }


class SharedPrefrence {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const String _sessionKey = 'chat_session_id_user'; // Unique key

  Future<void> setSessionId(String sessionId) async {
    final prefs = await _prefs;
    await prefs.setString(_sessionKey, sessionId);
  }

  Future<String?> getSessionId() async {
    final prefs = await _prefs;
    return prefs.getString(_sessionKey);
  }

  Future<void> clearSessionId() async {
    final prefs = await _prefs;
    await prefs.remove(_sessionKey);
  }
}

class SharedPrefrence2 {
  final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();

  static const String _sessionKey2 = 'chat_session_id_admin'; // Unique key

  Future<void> setSessionId2(String sessionId) async {
    final prefs = await _prefs2;
    await prefs.setString(_sessionKey2, sessionId);
  }

  Future<String?> getSessionId2() async {
    final prefs = await _prefs2;
    return prefs.getString(_sessionKey2);
  }

  Future<void> clearSessionId2() async {
    final prefs = await _prefs2;
    await prefs.remove(_sessionKey2);
  }
}