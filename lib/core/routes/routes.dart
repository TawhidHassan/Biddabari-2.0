import 'package:biddabari_new/core/common/data/Category/Categorie.dart';
import 'package:biddabari_new/features/AllCourse/presentation/pages/AllCourse_page.dart';
import 'package:biddabari_new/features/AllCourse/presentation/pages/category_course_page.dart';
import 'package:biddabari_new/features/AllCourse/presentation/pages/my_course_page.dart';
import 'package:biddabari_new/features/Blog/presentation/pages/Blog_page.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/BookStore/presentation/pages/BookStore_page.dart';
import 'package:biddabari_new/features/Checkout/presentation/pages/Checkout_page.dart';
import 'package:biddabari_new/features/ClassRoom/presentation/pages/ClassRoom_page.dart';
import 'package:biddabari_new/features/CourseProgress/presentation/pages/course_content_page.dart';
import 'package:biddabari_new/features/Exam/presentation/pages/Exam_page.dart';
import 'package:biddabari_new/features/Exam/presentation/pages/exam_details_page.dart';
import 'package:biddabari_new/features/Job/presentation/pages/Job_page.dart';
import 'package:biddabari_new/features/Login/presentation/pages/forget_password_page.dart';
import 'package:biddabari_new/features/Login/presentation/pages/otp_page.dart';
import 'package:biddabari_new/features/More/presentation/pages/More_page.dart';
import 'package:biddabari_new/features/Notice/data/models/Notice/Notice.dart';
import 'package:biddabari_new/features/Notice/presentation/pages/Notice_page.dart';
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/Gallary.dart';
import 'package:biddabari_new/features/PhotoGallary/presentation/pages/gallery_details_page.dart';
import 'package:biddabari_new/features/Teacher/data/models/Teacher/Teacher.dart';
import 'package:biddabari_new/features/Teacher/presentation/pages/all_teacher_page.dart';
import 'package:biddabari_new/features/dwonloads/presentation/pages/dwonloads_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Dependenci Injection/init_dependencies.dart';
import '../../features/AllCourse/data/models/course/Course.dart';
import '../../features/AllCourse/data/models/courseSection/CourseSection.dart';
import '../../features/AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../features/AllCourse/presentation/pages/course_details_page.dart';
import '../../features/Blog/data/models/Blog/Blog.dart';
import '../../features/Blog/presentation/pages/blog_details_page.dart';
import '../../features/BookStore/presentation/pages/book_cart.dart';
import '../../features/BookStore/presentation/pages/book_details.dart';
import '../../features/BookStore/presentation/pages/my_book_page.dart';
import '../../features/CourseProgress/presentation/pages/CourseProgress_page.dart';
import '../../features/CourseProgress/presentation/pages/course show/assignment_page.dart';
import '../../features/CourseProgress/presentation/pages/course show/exam_content.dart';
import '../../features/CourseProgress/presentation/pages/course show/note_content.dart';
import '../../features/CourseProgress/presentation/pages/course show/pdf_content_list.dart';
import '../../features/CourseProgress/presentation/pages/course show/video_content.dart';
import '../../features/CourseProgress/presentation/pages/course show/writen_exam_content.dart';
import '../../features/Error/presentation/error_page.dart';
import '../../features/Exam/presentation/pages/exam_rank_page.dart';
import '../../features/Exam/presentation/pages/given_exam_page.dart';
import '../../features/Exam/presentation/pages/my_exam_page.dart';
import '../../features/Exam/presentation/pages/see_answer_page.dart';
import '../../features/Home/presentation/pages/Home_page.dart';
import '../../features/Job/data/models/job_model.dart';
import '../../features/Job/presentation/pages/Job_details_page.dart';
import '../../features/Login/presentation/pages/Login_page.dart';
import '../../features/Login/presentation/pages/change_password_page.dart';
import '../../features/Login/presentation/pages/login_password_page.dart';
import '../../features/profile/presentation/pages/profile_edit_page.dart';
import '../../features/Login/presentation/pages/set_new_password_page.dart';
import '../../features/Login/presentation/pages/set_password_page.dart';
import '../../features/Main/presentation/pages/Main_page.dart';
import '../../features/More/presentation/pages/order/order_page.dart';
import '../../features/Notice/presentation/pages/notice_details_page.dart';
import '../../features/NotificationApp/presentation/pages/NotificationApp_page.dart';
import '../../features/PhotoGallary/presentation/pages/PhotoGallary_page.dart';
import '../../features/SaveIteam/presentation/pages/SaveIteam_page.dart';
import '../../features/Splash/presentation/pages/Splash_page.dart';
import '../../features/Splash/presentation/pages/onbording_page.dart';
import '../../features/Teacher/presentation/pages/teacher_details_page.dart';
import '../LocalDataBase/localdata.dart';
import '/core/routes/route_path.dart';


class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _shellNavigatorAllCourseKey =
      GlobalKey<NavigatorState>(debugLabel: 'allCourse');
  static final _shellNavigatorExamKey =
  GlobalKey<NavigatorState>(debugLabel: 'exam');
  static final _shellNavigatorBookStoreKey =
      GlobalKey<NavigatorState>(debugLabel: 'bookStore');
  static final _shellNavigatorFreeCourseKey =
      GlobalKey<NavigatorState>(debugLabel: 'freeCourse');
  static final _shellNavigatorClassRoomKey =
      GlobalKey<NavigatorState>(debugLabel: 'classRoom');


  static final GoRouter routerx = GoRouter(
    initialLocation: Routes.splashScreenPath,
    // navigatorKey: Get.key,
    debugLogDiagnostics: true,
    routes: [
      /// splash
      GoRoute(
        name: Routes.splashScreen,
        path: Routes.splashScreenPath,
        builder: (context, state) => SplashPage(),
        redirect:  (context, state) async {
          DBHelper dbHelper=serviceLocator();
          if(await dbHelper.onbordingCheck()){

            Future.delayed(const Duration(seconds: 3),(){
              AppRouter.router.goNamed(Routes.mainPage);
            });
          }else{
            Future.delayed(const Duration(seconds: 3),(){
              AppRouter.router.goNamed(Routes.onboardingScreen);
            });

          }
        },
      ),

      GoRoute(
        name: Routes.onboardingScreen,
        path: Routes.onboardingScreenPath,
        builder: (context, state) => OnbordingPage(),
      ),

      GoRoute(
        name: Routes.myExamPage,
        path: Routes.myExamPagePath,
        builder: (context, state) => MyExamPage(),
      ),

      GoRoute(
          name: Routes.checkOutPage,
          path: Routes.checkOutPagePath,
          pageBuilder: (context, state) {
            final Map data=state.extra as Map;
            return NoTransitionPage(
              child: CheckoutPage(
                course: data["course"],
                exam: data["exam"],
                parentExam: data["parentExam"],
                type: data["type"],
                book: data["book"],
              ),
            );
          },
          routes: []
      ),
      GoRoute(
          name: Routes.photoGallaryListPage,
          path: Routes.photoGallaryListPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: PhotoGallaryPage(),
          ),
          routes: [
            GoRoute(
                name: Routes.photoGallaryDetailsPage,
                path: Routes.photoGallaryDetailsPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: GallaryDetailsPage(
                    gallary: state.extra as Gallary,
                  ),
                ),
                routes: []
            ),
          ]
      ),

      GoRoute(
        name: Routes.forgetPasswordPage,
        path: Routes.forgetPasswordPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ForgetPasswordPage(),
        ),
      ),
      GoRoute(
        name: Routes.newPasswordPage,
        path: Routes.newPasswordPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: SetNewPasswordPage(),
        ),
      ),
      GoRoute(
        name: Routes.loginPage,
        path: Routes.loginPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: LoginPage(),
        ),
        redirect:  (context, state) async {
            DBHelper dbHelper=serviceLocator();
            if(await dbHelper.checkUserLogedIn()){
              // context.goNamed( Routes.mainPage);
              // Logger().w("sss");
              AppRouter.router.goNamed(Routes.mainPage);
              // context.goNamed(Routes.mainPage);
              // return Routes.MainPagePath;
            }
          },
        routes: [
          GoRoute(
            name: Routes.loginPasswordPage,
            path: Routes.loginPasswordPagePath,
            pageBuilder: (context, state) =>  NoTransitionPage(
            child: LoginPasswordPage(),
           ),
          ),


          GoRoute(
            name: Routes.otpPage,
            path: Routes.otpPagePath,
            pageBuilder: (context, state) =>  NoTransitionPage(
              child: OtpPage(),
            ),
            routes: [
              GoRoute(
                name: Routes.setPasswordPage,
                path: Routes.setPasswordPage,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: SetPasswordPage(),
                ),
              ),
            ]
          ),
        ]
      ),


      GoRoute(
          name: Routes.allTeacherPage,
          path: Routes.allTeacherPagePath,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AllTeacherPage(),
          ),
          routes: []
      ),
      GoRoute(
          name: Routes.teacherDetailsPage,
          path: Routes.teacherDetailsPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: TeacherDetailsPage(teacherId: state.extra as int,),
          ),
          routes: []
      ),

      GoRoute(
                name: Routes.bookDetailsPage,
                path: Routes.bookDetailsPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: BookDetailsPage( book: state.extra as Book,),
                ),
                routes: []
            ),

      GoRoute(
        name: Routes.givenExamPage,
        path: Routes.givenExamPagePath,
        pageBuilder: (context, state) {
          final Map data=state.extra as Map;
          return NoTransitionPage(
            child: GivenExamPage(
              id: data['id'],
              hasExam: data['hasExam'],
              isCourseExam:data['isCourseExam'] ,
              iswriitenExam:data['iswriitenExam'],
            ),
          );
        },
        routes: []
      ),
      GoRoute(
        name: Routes.answerExamPage,
        path: Routes.answerExamPagePath,
        pageBuilder: (context, state) {
          final Map data=state.extra as Map;
          return NoTransitionPage(
            child: SeeAnswerPage(
              id: data['id'],
              hasClassXm: data['hasClassXm'],
              isClassExam:data['isClassExam'] ,
              isCourseExam:data['isCourseExam'] ,
              iswriitenExam:data['iswriitenExam'],
            ),
          );
        },
        routes: []
      ),

      GoRoute(
        name: Routes.rankExamPage,
        path: Routes.rankExamPagePath,
        pageBuilder: (context, state) {
          final Map data=state.extra as Map;
          return NoTransitionPage(
            child: ExamRankingPage(
              id: data['id'],
              isCourseExam:data['isCourseExam'] ,
            ),
          );
        },
        routes: []
      ),


      GoRoute(
          name: Routes.morePage,
          path: Routes.morePagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: MorePage(),
          ),
          routes: []
      ),
      GoRoute(
          name: Routes.saveIteamPage,
          path: Routes.saveIteamPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: SaveIteamPage(),
          ),
          routes: []
      ),
      GoRoute(
          name: Routes.notificationPage,
          path: Routes.notificationPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: NotificationAppPage(),
          ),
          routes: []
      ),

      GoRoute(
          name: Routes.myCoursePage,
          path: Routes.myCoursePagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: MyCoursePage(),
          ),
          routes: []
      ),
      GoRoute(
          name: Routes.courseContentPage,
          path: Routes.courseContentPagePath,
          pageBuilder: (context, state){
            final Map data=state.extra as Map;
           return NoTransitionPage(
              child: CourseProgressPage(
                name: data["name"],
                id: data["id"],
              ),
            );
          },
          routes: [
            GoRoute(
                name: Routes.courseContentListPage,
                path: Routes.courseContentListPagePath,
                pageBuilder: (context, state){
                  return NoTransitionPage(
                    child: CourseContentListPage(
                     courseSection: state.extra as CourseSection,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                      name: Routes.noteContentPage,
                      path: Routes.noteContentPagePath,
                      pageBuilder: (context, state){
                        final Map data=state.extra as Map;
                        return NoTransitionPage(
                          child: NoteContentPage(
                            courseSectionContent: data["courseSectionContent"],
                            isive: data["isive"],
                            isLink: data["isLink"],
                          ),
                        );
                      },
                  ),
                  GoRoute(
                      name: Routes.pdfContentPage,
                      path: Routes.pdfContentPagePath,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          child: PdfContentPage(
                            courseSectionContent: state.extra as CourseSectionContent,
                          ),
                        );
                      },
                  ),
                  GoRoute(
                      name: Routes.assismentContentPage,
                      path: Routes.assismentContentPagePath,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          child: AssignmentContentPage(
                            courseSectionContent: state.extra as CourseSectionContent,
                          ),
                        );
                      },
                  ),
                  GoRoute(
                      name: Routes.videoContentPage,
                      path: Routes.videoContentPagePath,
                      pageBuilder: (context, state){
                        final Map data=state.extra as Map;
                        return NoTransitionPage(
                          child: VideoContent(
                            isCourseExam: data["isCourseExam"],
                            courseSectionContent: data["courseSectionContent"] ,
                          ),
                        );
                      },
                  ),

                ]
            ),
          ]
      ),

      GoRoute(
          name: Routes.detailsCoursePage,
          path: Routes.detailsCoursePagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: CourseDetailsPage(
                course:state.extra as Course
            ),
          ),
          routes: []
      ),
      GoRoute(
          name: Routes.examContentPage,
          path: Routes.examContentPagePath,
          pageBuilder: (context, state){
            final Map data=state.extra as Map;
            return NoTransitionPage(
              child: ExamContentPage(
                  courseSectionContent:data['courseSectionContent'],
                  isCourseExam:data['isCourseExam']
              ),
            );
          },
          routes: []
      ),
      GoRoute(
          name: Routes.writtenExamContentPage,
          path: Routes.writtenExamContentPagePath,
          pageBuilder: (context, state){
            final Map data=state.extra as Map;
            return NoTransitionPage(
              child: WritenExamContentPage(
                  courseSectionContent:data['courseSectionContent'],
                  isCourseExam:data['isCourseExam']
              ),
            );
          },
          routes: []
      ),
      GoRoute(
          name: Routes.examDetailsPage,
          path: Routes.examDetailsPagePath,
          pageBuilder: (context, state) {
            final Map data=state.extra as Map;
            return NoTransitionPage(
              child: ExamDetailsPage(
                id: data["id"],
                enrolle: data["enrolle"],
              ),
            );
          },
          routes: []
      ),
      GoRoute(
                name: Routes.myBookPage,
                path: Routes.myBookPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: MyBookPage(),
                ),
                routes: []
            ),
      GoRoute(
                name: Routes.bookCartPage,
                path: Routes.bookCartPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: BookCartPage(),
                ),
                routes: []
            ),
       GoRoute(
            name: Routes.noticePage,
            path: Routes.noticePagePath,
            pageBuilder: (context, state) =>  NoTransitionPage(
              child: NoticePage(),
            ),
            routes: [
              GoRoute(
                  name: Routes.noticeDetailsPage,
                  path: Routes.noticeDetailsPagePath,
                  pageBuilder: (context, state) =>  NoTransitionPage(
                    child: NoticeDetailsPage(
                      notice: state.extra as Notice
                    ),
                  ),
                  routes: []
              ),
            ]
        ),
       GoRoute(
            name: Routes.blogPage,
            path: Routes.blogPagePath,
            pageBuilder: (context, state) =>  NoTransitionPage(
              child: BlogPage(),
            ),
            routes: [
              GoRoute(
                  name: Routes.blogDetailsPage,
                  path: Routes.blogDetailsPagePath,
                  pageBuilder: (context, state) =>  NoTransitionPage(
                    child: BlogDetailsPage(
                       blog:state.extra as Blog
                    ),
                  ),
                  routes: []
              ),
            ]
        ),

      GoRoute(
            name: Routes.jobPage,
            path: Routes.jobPagePath,
            pageBuilder: (context, state) =>  NoTransitionPage(
              child: JobPage(),
            ),
            routes: [
              GoRoute(
                  name: Routes.jobDetailsPage,
                  path: Routes.jobDetailsPagePath,
                  pageBuilder: (context, state) =>  NoTransitionPage(
                    child: JobDetailsPage(job:state.extra as JobModel),
                  ),
                  routes: []
              ),
            ]
        ),


      GoRoute(
          name: Routes.changePasswordPage,
          path: Routes.changePasswordPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: ChangePasswordPage(),
          ),
          routes: []
      ),

      GoRoute(
          name: Routes.myDwonloadsPage,
          path: Routes.myDwonloadsPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: DwonloadsPage(),
          ),
          routes: []
      ),

      GoRoute(
          name: Routes.myOrderPage,
          path: Routes.myOrderPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: OrderPage(),
          ),
          routes: []
      ),

      GoRoute(
          name: Routes.profileEditPage,
          path: Routes.profileEditPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: ProfileEditPage(),
          ),
          routes: []
      ),

      ///Bottom nav bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            initialLocation: Routes.mainPagePath,
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              // top route inside branch
              GoRoute(
                  name: Routes.mainPage,
                  path: Routes.mainPagePath,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: HomePage(),
                  ),
                routes: [
                  GoRoute(
                      name: Routes.categoryCoursePage,
                      path: Routes.categoryCoursePagePath,
                      pageBuilder: (context, state) =>  NoTransitionPage(
                        child: CategoryCoursePage(categorie:state.extra as Categorie ,),
                      ),
                      routes: []
                  ),
                ]
              ),

            ],
          ),

          //------------------------------------live message section


          StatefulShellBranch(
            navigatorKey: _shellNavigatorAllCourseKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.allCoursePage,
                path: Routes.allCoursePagePath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AllCoursePage(),
                ),
                routes: [

                ]
              ),
            ],
          ),


          StatefulShellBranch(
            navigatorKey: _shellNavigatorExamKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.examPage,
                path: Routes.examPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: ExamPage(),
                ),
                routes: [

                ]

              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBookStoreKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.bookStorePage,
                path: Routes.bookStorePagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: BookStorePage(),
                ),
                routes: [

                ]

              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorFreeCourseKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.freeCoursePage,
                path: Routes.freeCoursePagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: AllCoursePage(),
                ),
                routes: [

                ]

              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorClassRoomKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.classRoomPage,
                path: Routes.classRoomPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: ClassRoomPage(),
                ),
                routes: [

                ]

              ),
            ],
          ),
        ],
      ),

      GoRoute(
        name: Routes.ErrorPage,
        path: Routes.ErrorPagePath,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ErrorPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  static GoRouter get router => routerx;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
