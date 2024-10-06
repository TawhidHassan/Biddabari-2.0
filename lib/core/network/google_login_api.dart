import 'package:google_sign_in/google_sign_in.dart';

class LoginApi{
  static final _googleSigin=GoogleSignIn();
  static Future<GoogleSignInAccount?> login()=>_googleSigin.signIn();
  static Future signout=_googleSigin.signOut();
}