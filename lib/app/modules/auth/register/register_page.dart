import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VakinhaAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cadastro",
                          style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark)),
                      Text(
                        "Preencha os campos abaixo para criar o seu cadastro.",
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      const VakinhaTextFormField(label: "Nome*"),
                      const SizedBox(height: 20),
                      const VakinhaTextFormField(label: "E-mail*"),
                      const SizedBox(height: 20),
                      const VakinhaTextFormField(label: "Senha*"),
                      const SizedBox(height: 20),
                      const VakinhaTextFormField(label: "Confirmar senha*"),
                      const SizedBox(height: 20),
                      VakinhaButton(
                        label: "CADASTRAR",
                        width: context.width,
                        height: 40,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
