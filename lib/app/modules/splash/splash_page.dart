import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFF140E0E),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/lanche.png',
              fit: BoxFit.cover,
              width: context.width,
            ),
          ),
          Align(
            child: Column(
              children: [
                SizedBox(
                  height: context.heightTransformer(reducedBy: 85),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: context.widthTransformer(reducedBy: 30),
                ),
                const SizedBox(height: 60),
                VakinhaButton(
                  label: "Acessar",
                  width: context.widthTransformer(reducedBy: 40),
                  onPressed: () {
                    Get.toNamed('auth/login');
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
