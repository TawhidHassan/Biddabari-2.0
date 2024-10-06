import '/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///staging
  static const String mainDomain = "https://test.emo-fun.com";
  static const String baseUrl = "$mainDomain/api/v1/";
  static const String imageBaseUrl = "https://test.emo-fun.com/";

      ///------------------------------End point----------------------------------------
  static  String OTP_SEND= 'send_otp'.addBaseURl;
  static  String OTP_VERIFY= 'submit_login'.addBaseURl;
  static  String SIGN_UP= 'customer-auth/signup'.addBaseURl;
  static  String SIGN_IN= 'customer-auth/login'.addBaseURl;
  static  String SIGN_GOOGLE_IN= 'login_with_gmail'.addBaseURl;
  static  String COUNTRY_LIST= 'get-country-code'.addBaseURl;

  static  String PACKGE_PURCHES= 'package/purchase'.addBaseURl;
  static  String PACKGE_LIST= 'package/get-package'.addBaseURl;
  static  String WALLET_PURCHESS_HISTORY_LIST= 'package/history'.addBaseURl;

  static  String FORGET_OTP_SET= 'customer-auth/send-forgot-password-otp'.addBaseURl;
  static  String FORGET_OTP_VERIFY= 'customer-auth/verify-forgot-password-otp'.addBaseURl;
  static  String SETUP_NEW_PASSWORD= 'customer-auth/reset-password'.addBaseURl;

  static  String GET_USER_PROFILE = 'get-profile/'.addBaseURl;
  static  String UPDATE_USER_PROFILE = 'update_profile'.addBaseURl;
  static  String IMAGE_UPLOAD = 'data-dump/upload-File/'.addBaseURl;




}
