import '/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///staging
  static const String mainDomain = "https://biddabari.online";
  static const String baseUrl = "$mainDomain/api/v1/";
  static const String imageBaseUrl = "https://biddabari-bucket.obs.as-south-208.rcloud.reddotdigitalit.com/";

      ///------------------------------End point----------------------------------------
  static  String OTP_SEND= 'send-otp?mobile='.addBaseURl;
  static  String OTP_MATCH= 'check-user-status-for-app'.addBaseURl;

  static  String LOGIN= 'login'.addBaseURl;
  static  String SIGNUP= 'register'.addBaseURl;
  static  String FORGET_PASSWORD_OTP= 'send-password-reset-otp'.addBaseURl;
  static  String FORGET_PASSWORD_CHANGE= 'verify-pass-reset-otp'.addBaseURl;

  static  String GET_USER_PROFILE= 'app-get-user-info'.addBaseURl;

  ///Slider
  static  String SLIDER_GET= 'app-home-slider-courses'.addBaseURl;
  static  String CATEGORY_LIST_GET= 'app-home-course-categories'.addBaseURl;

  static  String RUNNING_COURSE_LIST= 'app-home-courses'.addBaseURl;
  static  String ALL_COURSE_LIST= 'app-all-courses'.addBaseURl;
  static  String COURSE_DETAILS= 'app-course-details/'.addBaseURl;
  static  String CATEGORY_COURSE_LIST= 'category-courses/'.addBaseURl;
  static  String CLASSROM_MY_COURSE_LIST= 'student/my-courses'.addBaseURl;
  static  String CLASSROM_MY_CLASS_LIST= 'student/today-classes'.addBaseURl;
  static  String CLASSROM_MTODAY_EXAM_LIST= 'student/today-exams'.addBaseURl;

  ///book
  static  String TOP_BOOK_LIST= 'app-home-products'.addBaseURl;
  static  String STORE_BOOK_LIST= 'all-products'.addBaseURl;
  static  String STORE_BOOK_DETAILS= "product-details/".addBaseURl;


  ///teacher
  static  String TEACHER_LIST= 'all-instructors?page='.addBaseURl;




}
