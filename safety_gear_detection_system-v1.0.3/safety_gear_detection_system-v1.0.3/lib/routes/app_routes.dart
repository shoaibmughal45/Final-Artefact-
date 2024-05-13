import 'package:get/get.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/onboarding_screen/binding/onboarding_binding.dart';
import '../presentation/log_in_screen/log_in_screen.dart';
import '../presentation/log_in_screen/binding/log_in_binding.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/sign_up_screen/binding/sign_up_binding.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/home_container_screen/binding/home_container_binding.dart';
import '../presentation/edit_profile_screen/edit_profile_screen.dart';
import '../presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import '../presentation/history_screen/history_screen.dart';
import '../presentation/history_screen/binding/history_binding.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/notifications_screen/binding/notifications_binding.dart';



class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreen = '/onboarding_screen';

  static const String logInScreen = '/log_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String cardsPage = '/cards_page';
  static const String activityPage = '/activity_page';

  static const String profilePage = '/profile_page';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String historyScreen = '/history_screen';

  static const String notificationsScreen = '/notifications_screen';



  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),

    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: historyScreen,
      page: () => HistoryScreen(),
      bindings: [
        HistoryBinding(),
      ],
    ),
    GetPage(
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      bindings: [
        NotificationsBinding(),
      ],
    ),


   
   
 
   
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
