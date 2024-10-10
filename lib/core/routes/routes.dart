import 'package:biddabari_new/features/AllCourse/presentation/pages/AllCourse_page.dart';
import 'package:biddabari_new/features/BookStore/presentation/pages/BookStore_page.dart';
import 'package:biddabari_new/features/ClassRoom/presentation/pages/ClassRoom_page.dart';
import 'package:biddabari_new/features/Exam/presentation/pages/Exam_page.dart';
import 'package:biddabari_new/features/Login/presentation/pages/forget_password_page.dart';
import 'package:biddabari_new/features/Login/presentation/pages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Dependenci Injection/init_dependencies.dart';
import '../../features/Error/presentation/error_page.dart';
import '../../features/Home/presentation/pages/Home_page.dart';
import '../../features/Login/presentation/pages/Login_page.dart';
import '../../features/Login/presentation/pages/login_password_page.dart';
import '../../features/Login/presentation/pages/set_new_password_page.dart';
import '../../features/Login/presentation/pages/set_password_page.dart';
import '../../features/Main/presentation/pages/Main_page.dart';
import '../../features/Splash/presentation/pages/Splash_page.dart';
import '../../features/Splash/presentation/pages/onbording_page.dart';
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

      //-------------------------------chat with person
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
                routes: []
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
