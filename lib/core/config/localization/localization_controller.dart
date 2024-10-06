import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/config/Strings/app_strings.dart';
import '../../../../core/config/localization/language_model.dart';

class LocalizationController extends GetxController implements GetxService {

  LocalizationController(){
    loadCurrentLanguage();
  }

  //locale
  final _selectedLocale = Locale(AppStrings.languages[0].languageCode,
          AppStrings.languages[0].countryCode)
      .obs;
  Locale get selectedLocale => _selectedLocale.value;

  //selected index
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  //languages
  final _languages = RxList<LanguageModel>();
  List<LanguageModel> get languages => _languages;


  //--------------------------------------------load current language
  void loadCurrentLanguage() async{
    // _selectedLocale.value = Locale(
    //   LocalDbService.to.getLanguageCode ?? AppStrings.languages[0].languageCode,
    //   LocalDbService.to.getCountryCode ?? AppStrings.languages[0].countryCode
    // );

    for(int i = 0; i < AppStrings.languages.length; i++){
      if(AppStrings.languages[i].languageCode == selectedLocale.languageCode){
        _selectedIndex.value = i;
        break;
      }
    }

    _languages.value = [];
    _languages.addAll(AppStrings.languages);
    update();
  }

  //-----------------------------------------set language
  void setLanguage(Locale locale){
    Get.updateLocale(locale);
    _selectedLocale.value = locale;
    saveLanguage(selectedLocale);
    update();
  }

  //-----------------------------------------void save language
  void saveLanguage(Locale locale) async{
    // LocalDbService.to.saveCountryCode(locale.countryCode!);
    // LocalDbService.to.saveLanguageCode(locale.languageCode);
  }

  //-----------------------------------------set selected index
  void setSelectedIndex(int idx){
    _selectedIndex.value = idx;
    //LocalDbService.to.saveSelectedLangIndex(idx);
    update();
  }


}
