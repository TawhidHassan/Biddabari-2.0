
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/BatchExam/BatchExamResponse.dart';

abstract class ExamRemoteSource {

Future<BatchExamResponse?> getAllExam();
Future<ExamDetailsResponse?>   getExamDetails(int id);



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

  @override
  Future<ExamDetailsResponse?> getExamDetails(int id)async {
    // TODO: implement getExamDetails
    try{
      final result =await apiMethod.get(url: ApiEndpoint.BATCH_EXAM_DETAILS+"$id",showResult: true,isBasic: true,duration: 30);
      return ExamDetailsResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }


}
