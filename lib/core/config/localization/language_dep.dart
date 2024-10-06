import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/config/Strings/app_strings.dart';
import '../../../../core/config/localization/language_model.dart';
import '../../../../core/config/localization/localization_controller.dart';

Future<Map<String, Map<String, String>>> init() async{
  Get.lazyPut<LocalizationController>(() => LocalizationController());

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppStrings.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/translations/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}