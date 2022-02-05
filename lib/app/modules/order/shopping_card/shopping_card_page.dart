import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vaquinha_burguer/app/core/ui/formatter_helper.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
    
    final formKey = GlobalKey<FormState>();

    ShoppingCardPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: LayoutBuilder(
          builder: (_, constraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKey,
                    child: Visibility(
                      visible: controller.products.isNotEmpty,
                      replacement: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Carrinho',
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark
                              )
                            ),
                            const SizedBox(
                               height: 10.0
                            ),
                            const Text('Nenhum item adicionado no carrinho')
                          ]
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Carrinho',
                                  style: context.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark
                                  )
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red
                                  ),
                                  onPressed: controller.clear
                                )
                              ]
                            )
                          ),
                          Obx((){
                            return Column(
                              children: 
                                controller.products.map((p) => Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: PlusMinusBox(
                                    label: p.product.name,
                                    calculateTotal: true,
                                    elevated: true,
                                    backgroundColor: Colors.white,
                                    quantity: p.quantity, 
                                    price: p.product.price, 
                                    minusCallback: (){
                                      controller.addQuantityInProduct(p);
                                    }, 
                                    plusCallback: (){
                                      controller.subtractQuantityInProduct(p);
                                    }
                                  )
                                )
                              ).toList()
                            );
                          }),
                          const SizedBox(
                              height: 10.0
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Total do pedido',
                                  style: context.textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                Obx((){
                                  return Text(
                                    FormatterHelper.formatCurrency(controller.totalValue),
                                    style: context.textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.bold
                                    )
                                  );
                                })
                              ]
                            )
                          ),
                          const Divider(),
                          const _AdressField(),
                          const Divider(),
                          const _CpfField(),
                          const Divider(),
                          const Spacer(),
                          Center(
                            child: SizedBox(
                              width: context.widthTransformer(reducedBy: 10),
                              child: VakinhaButton(
                                label: 'FINALIZAR', 
                                onPressed: (){
                                  final formValid = formKey.currentState?.validate() ?? false;
                                  if(formValid){
                                    controller.createOrder();
                                  }
                                  
                                }
                              )
                            )
                          ),
                          const SizedBox(
                             height: 10.0
                          )
                        ]
                      ),
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

class _AdressField extends GetView<ShoppingCardController> {
  const _AdressField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 35.0,
            child: Expanded(
              child: Text(
                'Endereço de entrega',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10
                ),
              )
            )
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value){
              controller.adress = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              )
            )
          ),
          const SizedBox(
             height: 10.0
          )
        ]
      )
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 35.0,
            child: Expanded(
              child: Text(
                'CPF',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10
                ),
              )
            )
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value){
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigatório'),
              Validatorless.cpf('CPF inválido')
            ]),
            decoration: const InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              )
            )
          ),
          const SizedBox(
             height: 10.0
          )
        ]
      )
    );
  }
}