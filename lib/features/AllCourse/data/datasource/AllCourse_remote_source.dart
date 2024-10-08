import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class AllCourseRemoteSource {

Future<CourseResponse?> getRuningCourse();

}


class AllCourseRemoteSourceImpl implements AllCourseRemoteSource {
    final ApiMethod apiMethod;
   AllCourseRemoteSourceImpl({required this.apiMethod});

  @override
  Future<CourseResponse?> getRuningCourse()async {
    // TODO: implement getRuningCourse
    try{
      final result =await apiMethod.post(url: ApiEndpoint.RUNNING_COURSE_LIST,showResult: true,isBasic: false,duration: 30);
      return CourseResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
