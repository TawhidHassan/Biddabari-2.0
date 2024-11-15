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
  _initNotice();
  _initBlog();
  _initPhotoGallary();
  _initJob();
  _initExam();
  _initCourseProgress();
  _initAffiliation();
  _initSearch();





  serviceLocator.registerFactory(() => InternetConnection());

  /// core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SslConfig>(
    () => SslConfig(),
  );

  ///db
  serviceLocator.registerFactory<DBHelper>(
    () => DBHelper(),
  );
  serviceLocator.registerFactory<HiveService>(
    () => HiveService(),
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
void _initNotice(){
  /// Datasource
  serviceLocator
    ..registerFactory<NoticeRemoteSource>(
          () => NoticeRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<NoticeRepository>(
          () => NoticeRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => NoticeUseCase(
         noticeRepository:   serviceLocator(),
      ),
    );
}
void _initBlog(){
  /// Datasource
  serviceLocator
    ..registerFactory<BlogRemoteSource>(
          () => BlogRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<BlogRepository>(
          () => BlogRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => BlogUseCase(
         blogRepository:   serviceLocator(),
      ),
    );
}
void _initPhotoGallary(){
  /// Datasource
  serviceLocator
    ..registerFactory<PhotoGallaryRemoteSource>(
          () => PhotoGallaryRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<PhotoGallaryRepository>(
          () => PhotoGallaryRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => PhotoGallaryUseCase(
         photoGallaryRepository:   serviceLocator(),
      ),
    );
}
void _initJob(){
  /// Datasource
  serviceLocator
    ..registerFactory<JobRemoteSource>(
          () => JobRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<JobRepository>(
          () => JobRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => JobUseCase(
         jobRepository:   serviceLocator(),
      ),
    );
}
void _initExam(){
  /// Datasource
  serviceLocator
    ..registerFactory<ExamRemoteSource>(
          () => ExamRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<ExamRepository>(
          () => ExamRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => ExamUseCase(
         examRepository:   serviceLocator(),
      ),
    );
}

void _initCourseProgress(){
  /// Datasource
  serviceLocator
    ..registerFactory<CourseProgressRemoteSource>(
          () => CourseProgressRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<CourseProgressRepository>(
          () => CourseProgressRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => CourseProgressUseCase(
         courseProgressRepository: serviceLocator(),
      ),
    );
}
void _initAffiliation(){
  /// Datasource
  serviceLocator
    ..registerFactory<AffiliationRemoteSource>(
          () => AffiliationRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<AffiliationRepository>(
          () => AffiliationRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => AffiliationUseCase(
         affiliationRepository: serviceLocator(),
      ),
    );
}
void _initSearch(){
  /// Datasource
  serviceLocator
    ..registerFactory<SearchRemoteSource>(
          () => SearchRemoteSourceImpl(apiMethod: serviceLocator(),
      ),
    )/// Repository
    ..registerFactory<SearchRepository>(
          () => SearchRepositoryImpl(
          connectionChecker:  serviceLocator(),
          remoteSource:  serviceLocator()
      ),
    )/// Usecases
    ..registerFactory(
          () => SearchUseCase(
         searchRepository: serviceLocator(),
      ),
    );
}







