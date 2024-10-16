import 'package:biddabari_new/features/AllCourse/data/models/AllCourseResponse.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/CourseCategory/CourseCategoryResponse.dart';

abstract class AllCourseRemoteSource {

Future<CourseResponse?> getRuningCourse();
Future<AllCourseResponse?> getAllCourse();
Future<CourseCategoryResponse?> getCategoryCourse(String? slug);




}


class AllCourseRemoteSourceImpl implements AllCourseRemoteSource {
    final ApiMethod apiMethod;
   AllCourseRemoteSourceImpl({required this.apiMethod});

  @override
  Future<CourseResponse?> getRuningCourse()async {
    // TODO: implement getRuningCourse
    try{
      final result =await apiMethod.get(url: ApiEndpoint.RUNNING_COURSE_LIST,showResult: true,isBasic: true,duration: 30);
      return CourseResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AllCourseResponse?> getAllCourse()async {
    // TODO: implement getAllCourse
    try{
      final result =await apiMethod.get(url: ApiEndpoint.ALL_COURSE_LIST,showResult: true,isBasic: true,duration: 30);
      return AllCourseResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CourseCategoryResponse?> getCategoryCourse(String? slug) async{
    // TODO: implement getCategoryCourse
    try{
      final result =await apiMethod.get(url: ApiEndpoint.CATEGORY_COURSE_LIST+"$slug",showResult: true,isBasic: true,duration: 30);
      return CourseCategoryResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
