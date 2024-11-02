
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/BatchExam/BatchExamResponse.dart';
import '../models/BatchExam/MyExamResponse.dart';

abstract class ExamRemoteSource {

Future<BatchExamResponse?> getAllExam();
Future<ExamDetailsResponse?>getExamDetails(int id);
Future<MyExamResponse?>getMyExam();




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

  @override
  Future<MyExamResponse?> getMyExam()async {
    // TODO: implement getMyExam
    try{
      final result =await apiMethod.get(url: ApiEndpoint.MY_BATCH_EXAM,showResult: true,isBasic: false,duration: 30);
      return MyExamResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }


}
