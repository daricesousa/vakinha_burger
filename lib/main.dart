import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      getPages: [...SplashRouters.routers],
    );
  }
}
