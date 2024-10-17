part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initSplash();
  _initLogin();
  _initHome();
  _initMain();
  _initAllCourse();
  _initBookStore();
  _initProfile();
  _initTeacher();
  _initClassRoom();
  _initCheckout();
  _initMore();
  _initDwonloads();





  serviceLocator.registerFactory(() => InternetConnection());

  /// core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  ///db
  serviceLocator.registerFactory<LocationConfig>(
    () => LocationConfig(),
  );

  ///db
  serviceLocator.registerFactory<DBHelper>(
    () => DBHelper(),
  );

  ///Api client
  serviceLocator.registerFactory<ApiMethod>(
    () => ApiMethod(),
  );
}





void _initSplash(){
  /// Datasource
  serviceLocator
    ..registerFactory<SplashRemoteSource>(
          () => SplashRemoteSourceImpl(
                apiMethod:  serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<SplashRepository>(
          () => SplashRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      )
    )..registerFactory(
                  () => SplashUseCase(
                splashRepository:   serviceLocator(),
              ),

    );
}
/// home login
void _initLogin(){
  /// Datasource
  serviceLocator
    ..registerFactory<LoginRemoteSource>(
          () => LoginRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<LoginRepository>(
          () => LoginRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => LoginUseCase(
        loginRepository:   serviceLocator(),
      ),
    );
}


/// home init
void _initHome(){
  /// Datasource
  serviceLocator
    ..registerFactory<HomeRemoteSource>(
          () => HomeRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<HomeRepository>(
          () => HomeRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => HomeUseCase(
        homeRepository:   serviceLocator(),
      ),
    );
}

void _initMain(){
  /// Datasource
  serviceLocator
    ..registerFactory<MainRemoteSource>(
          () => MainRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<MainRepository>(
          () => MainRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => MainUseCase(
        mainRepository:   serviceLocator(),
      ),
    );
}

void _initAllCourse(){
  /// Datasource
  serviceLocator
    ..registerFactory<AllCourseRemoteSource>(
          () => AllCourseRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<AllCourseRepository>(
          () => AllCourseRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => AllCourseUseCase(
        allCourseRepository:   serviceLocator(),
      ),
    );
}
void _initBookStore(){
  /// Datasource
  serviceLocator
    ..registerFactory<BookStoreRemoteSource>(
          () => BookStoreRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<BookStoreRepository>(
          () => BookStoreRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => BookStoreUseCase(
        bookStoreRepository:   serviceLocator(),
      ),
    );
}

void _initProfile(){
  /// Datasource
  serviceLocator
    ..registerFactory<ProfileRemoteSource>(
          () => ProfileRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<ProfileRepository>(
          () => ProfileRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => ProfileUseCase(
        profileRepository:   serviceLocator(),
      ),
    );
}
void _initTeacher(){
  /// Datasource
  serviceLocator
    ..registerFactory<TeacherRemoteSource>(
          () => TeacherRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<TeacherRepository>(
          () => TeacherRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => TeacherUseCase(
        teacherRepository:   serviceLocator(),
      ),
    );
}
void _initClassRoom(){
  /// Datasource
  serviceLocator
    ..registerFactory<ClassRoomRemoteSource>(
          () => ClassRoomRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<ClassRoomRepository>(
          () => ClassRoomRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => ClassRoomUseCase(
        classRoomRepository:   serviceLocator(),
      ),
    );
}
void _initCheckout(){
  /// Datasource
  serviceLocator
    ..registerFactory<CheckoutRemoteSource>(
          () => CheckoutRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<CheckoutRepository>(
          () => CheckoutRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => CheckoutUseCase(
         checkoutRepository:   serviceLocator(),
      ),
    );
}
void _initMore(){
  /// Datasource
  serviceLocator
    ..registerFactory<MoreRemoteSource>(
          () => MoreRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<MoreRepository>(
          () => MoreRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => MoreUseCase(
         moreRepository:   serviceLocator(),
      ),
    );
}

void _initDwonloads(){
  /// Datasource
  serviceLocator
    ..registerFactory<DwonloadsRemoteSource>(
          () => DwonloadsRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<DwonloadsRepository>(
          () => DwonloadsRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => DwonloadsUseCase(
         dwonloadsRepository:   serviceLocator(),
      ),
    );
}







