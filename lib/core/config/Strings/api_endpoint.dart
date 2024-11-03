import '/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///staging
  // static const String mainDomain = "https://biddabari.online";
  static const String mainDomain = "https://Api.biddabari.com";
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
  static  String UPDATE_USER_PROFILE= 'student/profile-update'.addBaseURl;

  ///Slider
  static  String SLIDER_GET= 'app-home-slider-courses'.addBaseURl;
  static  String CATEGORY_LIST_GET= 'app-home-course-categories'.addBaseURl;

  static  String RUNNING_COURSE_LIST= 'app-home-courses'.addBaseURl;
  static  String ALL_COURSE_LIST= 'app-all-courses'.addBaseURl;
  static  String COURSE_DETAILS= 'app-course-details/'.addBaseURl;
  static  String MY_COURSE= 'student/my-courses'.addBaseURl;
  static  String CATEGORY_COURSE_LIST= 'category-courses/'.addBaseURl;
  static  String CLASSROM_MY_COURSE_LIST= 'student/my-courses'.addBaseURl;
  static  String CLASSROM_MY_CLASS_LIST= 'student/today-classes'.addBaseURl;
  static  String CLASSROM_MTODAY_EXAM_LIST= 'student/today-exams'.addBaseURl;

  static  String COURSE_CONTENT_LIST= 'student/course-contents/'.addBaseURl;
  static  String ASSIGMENT_SCRIPT_GET= 'student/show-pdf/'.addBaseURl;
  static  String ASSIGMENT_SCRIPT_TAKEN_OR_NOT= 'exist-assignment-status/'.addBaseURl;
  static  String ASSIGMENT_SUBMIT= 'student/upload-assignment-files'.addBaseURl;

  ///book
  static  String TOP_BOOK_LIST= 'app-home-products'.addBaseURl;
  static  String STORE_BOOK_LIST= 'all-products'.addBaseURl;
  static  String STORE_BOOK_DETAILS= "product-details/".addBaseURl;
  static  String MY_BOOK_LIST= "student/my-products".addBaseURl;


  ///teacher
  static  String TEACHER_LIST= 'all-instructors?page='.addBaseURl;
  static  String TEACHER_DETAILS= 'instructor-details/'.addBaseURl;


  static  String ORDER_LIST= 'student/my-orders'.addBaseURl;

  static  String NOTICE_LIST= 'all-notices'.addBaseURl;

  static  String BLOG_LIST= 'all-blogs?page='.addBaseURl;
  static  String BLOG_DETAILS= 'blog-details/'.addBaseURl;

  static  String PHOTO_GALLERY_LIST= 'all-gallery-images'.addBaseURl;
  static  String PHOTO_GALLERY_DETAILS= 'gallery-images/'.addBaseURl;


  static  String JOB_LIST= 'all-job-circulars'.addBaseURl;


  static  String BATCH_EXAM_LIST= 'all-exams'.addBaseURl;
  static  String BATCH_EXAM_DETAILS= 'category-exams/'.addBaseURl;
  static  String MY_BATCH_EXAM= 'student/my-exams'.addBaseURl;


  static  String GET_CONTENT_COMMENT= 'get-comments'.addBaseURl;
  static  String SUBMIT_CONTENT_COMMENT= 'new-comment'.addBaseURl;

  static  String START_CLASS_EXAM= 'start-class-exam'.addBaseURl;
  static  String START_COURSE_EXAM= 'start-course-exam'.addBaseURl;
  static  String START_BATCH_EXAM= 'start-batch-exam'.addBaseURl;


  static  String ORDER_COURSE= 'place-course-order/'.addBaseURl;
  static  String ORDER_EXAM= 'student/order-exam/'.addBaseURl;
  static  String ORDER_BOOK= 'place-app-product-order/'.addBaseURl;

  static  String DELIVERY_CHARGE= "get-delivery-charge-for-app".addBaseURl;


  static  String FAVORAITE_QUESTION_LIST= "get-favourite-questions/".addBaseURl;
  static  String ANSWER_QUESTION_LIST= "get-favourite-questions/".addBaseURl;


  static  String ANSWER_CLASS_EXAM= "student/show-class-exam-answers/".addBaseURl;
  static  String ANSWER_COURSE_EXAM= "student/show-course-exam-answers/".addBaseURl;
  static  String ANSWER_BATCH_EXAM= "student/show-batch-exam-answers/".addBaseURl;


  static  String COURSE_EXAM_RESULT_SUBMIT= "student/get-course-exam-result/".addBaseURl;
  static  String COURSE_BATCH_EXAM_RESULT_SUBMIT= "student/get-batch-exam-result/".addBaseURl;
  static  String COURSE_CLASS_EXAM_RESULT_SUBMIT= "student/get-course-class-exam-result/".addBaseURl;


  static  String SAVE_QUESTION= "favourite-question/".addBaseURl;
  static  String REMOVE_QUESTION= "delete-favourite-question/".addBaseURl;




}
