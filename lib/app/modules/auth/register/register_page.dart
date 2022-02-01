import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(elevation: 0.0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Cadastro",
                    style: context.textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark
                    )
                  ),
                  Text(
                    "Preencha os campos abaixo para criar o seu cadastro.",
                    style: context.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark
                    )
                  ),
                  const SizedBox(height: 30.0),
                  const VakinhaTextformfield(
                    label: "Nome"
                  ),
                  const SizedBox(height: 30.0),
                  const VakinhaTextformfield(
                    label: "E-mail"
                  ),
                  const SizedBox(height: 30.0),
                  const VakinhaTextformfield(
                    label: "Senha"
                  ),
                  const SizedBox(height: 30.0),
                  const VakinhaTextformfield(
                    label: "Confirma senha"
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: VakinhaButton(
                      width: context.width,
                      label: "Cadastrar",
                      onPressed: (){

                      }
                    )
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}