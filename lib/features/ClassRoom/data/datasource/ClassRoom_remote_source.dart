import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../../../AllCourse/data/models/Student/CourseOrderResponse.dart';
import '../../../AllCourse/data/models/courseSectionContent/CourseSectionContentResponse.dart';
import '../../../Exam/data/models/TodayExamResponse.dart';

abstract class ClassRoomRemoteSource {

Future<CourseOrderResponse?> getMyCourse();
Future<CourseSectionContentResponse?> getMyClass();
Future<TodayExamResponse?> getTodayExam();


}


class ClassRoomRemoteSourceImpl implements ClassRoomRemoteSource {
    final ApiMethod apiMethod;
   ClassRoomRemoteSourceImpl({required this.apiMethod});

  @override
  Future<CourseOrderResponse?> getMyCourse()async {
    // TODO: implement getMyCourse
  try{
    final result =await apiMethod.get(url: ApiEndpoint.CLASSROM_MY_COURSE_LIST,showResult: true,isBasic: false,duration: 30);
    return CourseOrderResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<CourseSectionContentResponse?> getMyClass() async{
    // TODO: implement getMyClass
    try{
      final result =await apiMethod.get(url: ApiEndpoint.CLASSROM_MY_CLASS_LIST,showResult: true,isBasic: false,duration: 30);
      return CourseSectionContentResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<TodayExamResponse?> getTodayExam() async{
    // TODO: implement getTodayExam
    try{
      final result =await apiMethod.get(url: ApiEndpoint.CLASSROM_MTODAY_EXAM_LIST,showResult: true,isBasic: false,duration: 30);
      return TodayExamResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }


}
