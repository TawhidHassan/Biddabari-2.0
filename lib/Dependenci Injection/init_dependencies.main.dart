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







