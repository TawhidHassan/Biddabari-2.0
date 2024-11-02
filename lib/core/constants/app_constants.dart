class AppConstants {
  AppConstants._();

  static const bool isProduction = true;

  static const String baseUrl =
  // isProduction
  //     ? 'https://tokenized.pay.bka.sh/v1.2.0-beta'
  //     :
  'https://tokenized.sandbox.bka.sh/v1.2.0-beta';

  static const String createToken = '$baseUrl/tokenized/checkout/token/grant';
  static const String refreshToken = '$baseUrl/tokenized/checkout/token/refresh';
  static const String createPayment = '$baseUrl/tokenized/checkout/create';
  static const String executePayment = '$baseUrl/tokenized/checkout/execute';

  /// TODO bKash credentials (Need to change in production)
  static const String username = '01770618567';
  static const String password = 'D7DaC<*E*eG';
  static const String appKey = '0vWQuCRGiUX7EPVjQDr0EUAYtc';
  static const String appSecret = 'jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx';


  ///production
  // static const String username = '01896060888';
  // static const String password = 'FjY%8ShYf@}';
  // static const String appKey = 'YNpYUucNwX0uxfoUa9hJ4Jf1tc';
  // static const String appSecret = 'vFqcGRRIeqqpjVe5q3PsTOEc7ttg0wqncqOWmlDSvAWAXqX3mlLb';


}
