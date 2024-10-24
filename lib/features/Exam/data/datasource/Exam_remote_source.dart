
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/BatchExam/BatchExamResponse.dart';

abstract class ExamRemoteSource {

Future<BatchExamResponse?> getAllExam();

}


class ExamRemoteSourceImpl implements ExamRemoteSource {
    final ApiMethod apiMethod;
   ExamRemoteSourceImpl({required this.apiMethod});

  @override
  Future<BatchExamResponse?> getAllExam() async{
    // TODO: implement getAllExam
  try{
    final result =await apiMethod.get(url: ApiEndpoint.BATCH_EXAM_LIST,showResult: true,isBasic: true,duration: 30);
    return BatchExamResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }


}
