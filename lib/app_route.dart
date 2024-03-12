
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/screen/login_screen.dart';
import 'package:flutter_application/screen/product_screen.dart';
import 'package:flutter_application/screen/sign_up_screen.dart';
import 'package:flutter_application/screen/welcome_screen.dart';

class AppRouter {
  static const String welcome = 'welcome';
  static const String product = 'product';
  static const String login = 'login';
  static const String home = 'home';
  static const String signup = 'signup';


  static get routes => {
        welcome: (context) => const WelcomeScreen(),
        product: (context) =>  ProductScreen(),
        login:(context) => const LoginScreen(),
        home:(context) => const HomeScreen(),
        signup: (context) => const SignupScreen(),
      };
}