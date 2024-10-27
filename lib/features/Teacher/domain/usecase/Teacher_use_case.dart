
import 'package:biddabari_new/features/Teacher/data/models/Teacher/TeacherResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/Teacher/Teacher.dart';
import '../../data/models/Teacher/TeacherDetailsResponse.dart';
import '../entities/Teacher.dart';
import '../repositories/Teacher_repository.dart';
import '../../../../core/usecase/usecase.dart';


class TeacherUseCase implements UseCase<Teacher, GetTeacherParams> {
final TeacherRepository? teacherRepository;
TeacherUseCase({this.teacherRepository});
    @override
    Future<Either<Failure, Teacher>> call(GetTeacherParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }



  @override
  Future<Either<Failure, TeacherResponse>> getAllTeacher({required int limit, required String page}) {
  // TODO: implement call
  return teacherRepository!.getAllTeacher(
    limit: limit,
    page: page,
  );
  }

  @override
  Future<Either<Failure, TeacherDetailsResponse>> getTeacherDetails({required int id}) {
  // TODO: implement call
  return teacherRepository!.getTeacherDetails(
    id: id,
  );
  }



}


class GetTeacherParams {
final int? page;

GetTeacherParams({
this.page,

});
}