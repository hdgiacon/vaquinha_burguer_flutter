
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vaquinha_burguer/app/modules/splash/splash_page.dart';

class SplashRouters{
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/', page: () => const SplashPage())
  ];
}