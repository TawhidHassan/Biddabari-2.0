import 'package:biddabari_new/features/Job/data/models/JobResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class JobRemoteSource {

Future<JobResponse?> getJobs();

}


class JobRemoteSourceImpl implements JobRemoteSource {
    final ApiMethod apiMethod;
   JobRemoteSourceImpl({required this.apiMethod});

  @override
  Future<JobResponse?> getJobs()async {
    // TODO: implement getJobs
  try{
    final result =await apiMethod.get(url: ApiEndpoint.JOB_LIST,showResult: true,isBasic: true,duration: 30);
    return JobResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }


}
