import 'package:flutter/material.dart';
import 'package:keley_app/routing/routings_constants.dart';
import 'package:keley_app/screens/date_screen/date_screen.dart';
import 'package:keley_app/screens/init_screen/initial_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:keley_app/screens/name_screen/name_screen.dart';
import 'package:keley_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:keley_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:keley_app/screens/success_screen/success_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case RoutingConstants.OnBoardingViewRoute:
      return CupertinoPageRoute(
          builder: (context) => InitialScreen(), fullscreenDialog: true);
    case RoutingConstants.LoginViewRoute:
      return CupertinoPageRoute(
          builder: (context) => SignInScreen(), fullscreenDialog: true);
    case RoutingConstants.SignUPViewRoute:
      return CupertinoPageRoute(
          builder: (context) => SignUpScreen(), fullscreenDialog: true);
    case RoutingConstants.DateViewRoute:
      return CupertinoPageRoute(
          builder: (context) => DateScreen(), fullscreenDialog: true);
    case RoutingConstants.NameViewRoute:
      return CupertinoPageRoute(
          builder: (context) => NameScreen(), fullscreenDialog: true);
    case RoutingConstants.SuccessViewRoute:
      return CupertinoPageRoute(
          builder: (context) => SuccessScreen(), fullscreenDialog: true);
    // case RoutingConstants.LoginViewRoute:
    //   return CupertinoPageRoute(builder: (context) => LoginScreen());
    // case RoutingConstants.ProfileViewRoute:
    //   return CupertinoPageRoute(builder: (context) => ProfileScreen());
    // case RoutingConstants.RegisterViewRoute:
    //   return CupertinoPageRoute(builder: (context) => RegisterScreen());
    // case RoutingConstants.SectionsViewRoute:
    //   return CupertinoPageRoute(
    //       builder: (context) => SectionScreen(), fullscreenDialog: true);
    // case RoutingConstants.OnBoardingViewRoute:
    //   return CupertinoPageRoute(builder: (context) => OnBoardingScreen());
    // case RoutingConstants.BlogViewRoute:
    //   return CupertinoPageRoute(builder: (context) => BlogScreen());
    // case RoutingConstants.ArticleViewRoute:
    //   Article arguments = settings.arguments;
    //   return CupertinoPageRoute(
    //       builder: (context) => ArticleDetailsScreen(
    //         art: arguments,
    //       ));
    // case RoutingConstants.CertificatesViewRoute:
    //   return CupertinoPageRoute(builder: (context) => CertificatesScreen());
    // case RoutingConstants.CertificateDetailsViewRoute:
    //   Certificate arguments = settings.arguments;
    //   return CupertinoPageRoute(
    //       builder: (context) => CertificateDetailsScreen(
    //         cer: arguments,
    //       ));
    // case RoutingConstants.CourseDetailsViewRoute:
    //   Course arguments = settings.arguments;
    //   return CupertinoPageRoute(
    //       builder: (context) => CourseDetailsScreen(
    //         cer: arguments,
    //       ));
    // case RoutingConstants.PlayCourseViewRoute:
    //   Course arguments = settings.arguments;
    //   return CupertinoPageRoute(
    //       builder: (context) => PlayCourseScreen(
    //         course: arguments,
    //       ));
    // case RoutingConstants.AboutViewRoute:
    //   return CupertinoPageRoute(builder: (context) => AboutScreen());
    // case RoutingConstants.ContactViewRoute:
    //   return CupertinoPageRoute(builder: (context) => ContactScreen());
    // case RoutingConstants.CoursesViewRoute:
    //   Section arguments = settings.arguments;
    //   return CupertinoPageRoute(builder: (context) => CoursesScreen(section: arguments,));
    // case RoutingConstants.MyCoursesViewRoute:
    //   return CupertinoPageRoute(builder: (context) => MyCoursesScreen());
    default:
      return CupertinoPageRoute(builder: (context) => InitialScreen());
  }
}
