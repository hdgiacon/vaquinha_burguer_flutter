import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/core/ui/formatter_helper.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {

  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({ 
    Key? key,
    required this.quantity,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''),),
      body: Material(
        elevation: elevated ? 5 : 0,
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.black26,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: label != null,
                child: Text(
                  label ?? '',
                  style: const TextStyle(fontSize: 15.0),
                  overflow: TextOverflow.ellipsis
                )
              ),
              Row(
                children: <Widget>[
                  VakinhaRoundedButton(
                    label: '-',
                    onPressed: minusCallback
                  ),
                  Text('$quantity'),
                  VakinhaRoundedButton(
                    label: '+',
                    onPressed: plusCallback
                  )
                ]
              ),
              Visibility(
                visible: label == null,
                child: const Spacer()
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                constraints: const BoxConstraints(minWidth: 70.0),
                child: Text(
                  FormatterHelper.formatCurrency(calculateTotal ? price * quantity : price)
                )
              )
            ]
          )
        )
      )
    );
  }
}