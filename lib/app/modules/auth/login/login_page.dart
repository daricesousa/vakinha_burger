import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VakinhaAppBar(),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (_, constraints) {
            return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Login",
                                style: context.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark)),
                            const SizedBox(height: 30),
                            const VakinhaTextFormField(label: "E-mail"),
                            const SizedBox(height: 30),
                            const VakinhaTextFormField(label: "Senha"),
                            const SizedBox(height: 50),
                            VakinhaButton(
                                label: "ENTRAR",
                                width: context.width,
                                height: 40,
                                onPressed: () {}),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Não possui uma conta?"),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed('auth/register');
                                  },
                                  child: const Text(
                                    "Cadastre-se",
                                    style: VakinhaUI.textBold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ));
          },
        ));
  }
}
