import 'package:flutter/material.dart';
import 'package:wallet/app/utils/navigation_animations.dart';
import 'package:wallet/app/view/home/page/home_page.dart';
import 'package:wallet/app/view/login/page/login_page.dart';
import 'package:wallet/app/view/registration/page/register_page.dart';
import 'package:wallet/routing/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// these args are for arguments,
    /// if we need to pass some argument we will do it through args
    // final dynamic args = settings.arguments;

    switch (settings.name) {
      case SignIn:
        return SlideAnimationTween(widget: LoginPage());
      case SignUp:
        return SlideAnimationTween(widget: RegistrationPage());
      case Home:
        return SlideAnimationTween(widget: HomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<void>(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Container(
            child: const Text('Error Screen'),
          ),
        ),
      );
    });
  }
}
