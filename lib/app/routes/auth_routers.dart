import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/auth/login/login_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
  ];
}
