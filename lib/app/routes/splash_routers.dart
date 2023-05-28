import 'package:get/get_navigation/get_navigation.dart';
import 'package:vakinha_burger/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();
  static final routers = <GetPage>[
    GetPage(name: '/', page: () => const SplashPage())
  ];
}
