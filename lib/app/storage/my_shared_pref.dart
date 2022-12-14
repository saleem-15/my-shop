import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  // get storage
  static late final GetStorage _storage;

  // STORING KEYS
  // static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _searchSuggestion = 'search_suggestion';

  static const String _userToken = 'user_token';
  static const String _name = 'user_name';
  static const String _nickName = 'user_nickName';
  static const String _email = 'user_email';
  static const String _phone = 'user_phone';
  static const String _dateOfBirth = 'user_dateOfBirth';
  static const String _image = 'user_image';


  /// init get storage services
  static init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  static void setSearchHisotryList(List<String> searchSuggestions) =>
      _storage.write(_searchSuggestion, searchSuggestions);
  static List<String> get getRecentSearchs => (_storage.read(_searchSuggestion) ?? []).cast<String>();

  static void addSearch(String suggestion) {
    final List<String> suggestionsList = getRecentSearchs;

    /// if it exists in the search history
    if (suggestionsList.contains(suggestion)) {
      return;
    }
    suggestionsList.add(suggestion);
    setSearchHisotryList(suggestionsList);
  }

  static void removeSearch(String suggestion) {
    final List<String> suggestionsList = getRecentSearchs;
    suggestionsList.removeWhere((e) => e == suggestion);
    setSearchHisotryList(suggestionsList);
  }

  static void setUserToken(String? userToken) => _storage.write(_userToken, userToken);

  /// takse a function that listens to changes to userToken
  static void userTokenListener(void Function(dynamic x) listener) =>
      _storage.listenKey(_userToken, listener);

  static String? get getToken => _storage.read(_userToken) == 'null' ? null : _storage.read(_userToken);

  /// set theme current type as light theme
  static void setThemeMode(ThemeMode themeMode) => _storage.write(_lightThemeKey, themeMode.name);

  /// get if the current theme type is light
  static ThemeMode get getThemeMode {
    /// the theme mode is stored as string
    final String? themeMode = _storage.read(_lightThemeKey);

    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;

      default:
        return ThemeMode.light;
    }
  }

  /// save current locale
  static void setCurrentLanguage(String languageCode) => _storage.write(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _storage.read(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  static String get getUserName => _storage.read(_name);
  static void setUserName(String userName) => _storage.write(_name, userName);

  static String get getUserNickName => _storage.read(_nickName);
  static void setUserNickName(String nickName) => _storage.write(_nickName, nickName);

  static String get getUserEmail => _storage.read(_email);
  static void setUserEmail(String userEmail) => _storage.write(_email, userEmail);

  static String get getUserPhoneNumber => _storage.read(_phone);
  static void setUserPhoneNumber(String phoneNumber) => _storage.write(_phone, phoneNumber);

  static String get getUserDateOfBirth => _storage.read(_dateOfBirth);
  static void setUserDateOfBirth(String dateOfBirth) => _storage.write(_dateOfBirth, dateOfBirth);

  static void storeUserData(String name, String nickName, String email, String phone, String dateOfBirth) {
    MySharedPref.setUserName(name);
    MySharedPref.setUserNickName(nickName);
    MySharedPref.setUserEmail(email);
    MySharedPref.setUserPhoneNumber(phone);
    MySharedPref.setUserDateOfBirth(dateOfBirth);
  }
}
