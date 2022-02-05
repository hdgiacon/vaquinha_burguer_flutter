import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaquinha_burguer/app/core/ui/formatter_helper.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/models/order_pix.dart';

class PixPage extends StatelessWidget {

  final OrderPix _orderPix = Get.arguments;

  PixPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCode = Uri.parse(_orderPix.image).data;

    return Scaffold(
      appBar: VakinhaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Valor a pagar',
                  style: context.textTheme.headline4
                ),
                Text(
                  FormatterHelper.formatCurrency(_orderPix.totalValue),
                  style: context.textTheme.headline4?.copyWith(
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold
                  )
                ),
                Image.memory(
                  qrCode!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 50)
                ),
                TextButton(
                  child: Text(
                    'PIX copia e cola',
                    style: context.textTheme.headline4?.copyWith(
                      fontSize: 30.0,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed
                    )
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.grey
                  ),
                  onPressed: (){
                    Clipboard.setData(ClipboardData(text:  _orderPix.code));
                    Get.rawSnackbar(
                      message: 'Código Pix copiado',
                      snackPosition: SnackPosition.BOTTOM
                    );
                  }
                )
              ]
            )
          )
        ]
      )
    );
  }
}