import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data.dart';

class GeneralProvider with ChangeNotifier {
  //Checking if user is connected to the internet or not
  bool isConnected = false;
  Future<void> isUserConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint("Error when checking connexion to internet!");
      debugPrint("Error: $e");
      isConnected = false;
    }
  }

  bool isLoading = false;

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  //Fetching all preferences
  SharedPreferences? pref;

  void getPrefs(SharedPreferences p) {
    pref = p;
    _isDark = pref!.getBool('isDark') ?? false;
    _userID = pref!.getString('userID') ?? "";
    _userName = pref!.getString('userName') ?? "";
    _userPlace = pref!.getInt('userPlace') ?? 0;
    _userScore = pref!.getInt('userScore') ?? 0;
    _currentUser = UserModel(
      id: _userID,
      name: _userName,
      place: _userPlace,
      score: {0: _userScore},
    );
    notifyListeners();
  }

  //USER HANDLING
  UserModel _currentUser = UserModel(id: "", name: "", place: 0, score: {0: 0});
  String _userName = "";
  String _userID = "";
  int _userPlace = 0;
  int _userScore = 0;

  void setUserScore(bool isCorrect, int level, int score) {
    if (isCorrect) {
      _userScore += score;
      currentUser.score[level] = score;
      currentUser.score[0] = _userScore;
      if (pref != null) pref!.setInt("userScore", _userScore);
    }
  }

  UserModel get currentUser => _currentUser;

  void setUserName(String name) {
    _userName = name.substring(0, 1).toUpperCase();
    _userName += name.substring(1);
    if (pref != null) pref!.setString("userName", _userName);
    notifyListeners();
  }

  Future<void> logInUser(String name) async {
    changeLoadingState();
    setUserName(name);
    await FirebaseAuth.instance.signInAnonymously();
    _userID = FirebaseAuth.instance.currentUser?.uid ?? "";
    if (pref != null) {
      pref!.setString("userID", _userID);
      pref!.setInt("userPlace", _userPlace);
      pref!.setInt("userScore", _userScore);
    }
    _currentUser = UserModel(
      id: _userID,
      name: _userName,
      place: _userPlace,
      score: {0: _userScore},
    );
    changeLoadingState();
    notifyListeners();
  }

  Future<void> logOutUser() async {
    changeLoadingState();
    await FirebaseAuth.instance.signOut();
    _userID = "";
    _userName = "";
    _userPlace = 0;
    _userScore = 0;
    if (pref != null) {
      pref!.remove("userID");
      pref!.remove("userName");
      pref!.remove("userPlace");
      pref!.remove("userScore");
    }
    changeLoadingState();
    notifyListeners();
  }

  //SOUND HANDLING
  bool soundOn = true;

  void soundOnOff() {
    soundOn = !soundOn;
    if (pref != null) pref!.setBool("sound", soundOn);
    notifyListeners();
  }

  //USER AVATAR HANDLING
  String? _gender;
  String? get gender => _gender;

  void setGender(String? value) {
    _gender = value;
    notifyListeners();
  }

  Uint8List? _userAvatar;
  Uint8List? get userAvatar => _userAvatar;

  void setUserAvatar() async {
    changeLoadingState();
    _userAvatar = await FirebaseAiImagenService.generateProfileImage(
      gender ?? "Male/Female",
    );
    changeLoadingState();
    notifyListeners();
  }

  //APP THEME MODE HANDLING
  bool _isDark = false;

  bool get isDark => _isDark;

  void changeTheme(bool themeValue) {
    _isDark = themeValue;
    if (pref != null) pref!.setBool('isDark', _isDark);
    notifyListeners();
  }
}
