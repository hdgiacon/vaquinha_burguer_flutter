import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(elevation: 0.0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints){
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: context.textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark
                        )
                      ),
                      const SizedBox(height: 30.0),
                      const VakinhaTextformfield(
                        label: "E-mail"
                      ),
                      const SizedBox(height: 30.0),
                      const VakinhaTextformfield(
                        label: "Senha"
                      ),
                      const SizedBox(height: 50.0),
                      Center(
                        child: VakinhaButton(
                          width: context.width,
                          label: "ENTRAR",
                          onPressed: (){

                          }
                        )
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Não possui uma conta?"),
                          TextButton(
                            child: const Text(
                              "Cadastre-se",
                              style: VakinhaUi.textBold,
                            ),
                            onPressed: (){
                              Get.toNamed('/auth/register');
                            }
                          )
                        ],
                      )
                    ]
                  )
                )
              )
            )
          );
        }
      )
    );
  }
}