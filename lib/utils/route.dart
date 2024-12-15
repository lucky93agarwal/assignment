import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:coding_assignment/ui/screens/home.dart';
import 'package:coding_assignment/ui/screens/login.dart';
import 'package:coding_assignment/ui/screens/noInternet.dart';
import 'package:coding_assignment/ui/screens/sendAmount.dart';
import 'package:coding_assignment/ui/screens/splash.dart';
import 'package:coding_assignment/ui/screens/transaction_screen.dart';
import 'package:get/get.dart';

class ScreenRouter{
  static List<GetPage> routes = [
    GetPage(name: RoutePath.login, page: ()=> LoginScreen()),
    GetPage(name: RoutePath.splash, page: ()=>  SplashScreen()),
    GetPage(name: RoutePath.noInternet, page: ()=> const NoInternetScreen()),
    GetPage(name: RoutePath.homeScreen, page: ()=> HomeScreen()),
    GetPage(name: RoutePath.sendAmount, page: ()=> const SendAmountScreen()),
    GetPage(name: RoutePath.transaction, page: ()=> TransactionScreen()),
  ];
}