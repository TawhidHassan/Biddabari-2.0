import 'package:biddabari_new/features/Teacher/data/models/Teacher/TeacherResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class TeacherRemoteSource {
  Future<TeacherResponse?> getAllTeacher({required int limit, required String page});
}


class TeacherRemoteSourceImpl implements TeacherRemoteSource {
    final ApiMethod apiMethod;
   TeacherRemoteSourceImpl({required this.apiMethod});

  @override
  Future<TeacherResponse?> getAllTeacher({required int limit, required String page})async {
    // TODO: implement getAllTeacher
  try{
    final result =await apiMethod.get(url: ApiEndpoint.TEACHER_LIST+"$page",showResult: true,isBasic: true,duration: 30);
    return TeacherResponse.fromJson(result!);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

// @override
// Future<LoginResponseModel?> login(String email,String deviceToken, String pass, bool isPg)async {
//
//   Map<String, dynamic> data = {
//   "email":email,
//   "password":pass,
//   "isPG":isPg,
//   "mobileToken":deviceToken
//   };
//   try{
//     final result =await apiMethod.post(url: ApiEndpoint.LOGIN,body: data,showResult: true,isBasic: true,duration: 30);
//     return LoginResponseModel.fromJson(result);
//   }catch (e) {
//     throw ServerException(e.toString());
//   }
// }
}
