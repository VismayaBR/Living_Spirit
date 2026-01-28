import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../domain/entities/onbaord_entity.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/params/api_input_params.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    getUser();
    observeUser();
    getIntro();
  }

  final box = GetStorage();

  UserEntity? get user => _userEntity;

  UserEntity? _userEntity;

  OnBoardEntity? get intro => _onBoardEntity;

  OnBoardEntity? _onBoardEntity;

  getUser() {
    String? jsonUser = box.read("user");
    if (jsonUser != null) {
      _userEntity = UserEntity.fromJson(jsonDecode(jsonUser));
    }
  }

  observeUser() {
    box.listenKey("user", (user) {
      if (user != null) {
        _userEntity = UserEntity.fromJson(jsonDecode(user));
      } else {
        _userEntity = null;
      }
      notifyListeners();
    });
  }

  getUserDetails() {
    final language = Get.locale;
    ApiInputParams apiInputParams =
        ApiInputParams(language: language!.languageCode);
    return apiInputParams;
  }

  getIntro() {
    String? jsonUser = box.read("intro");
    if (jsonUser != null) {
      _onBoardEntity = OnBoardEntity.fromJson(jsonDecode(jsonUser));
    }
  }
}
