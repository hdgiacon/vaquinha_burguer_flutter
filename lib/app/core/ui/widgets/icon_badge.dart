import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/core/ui/vakinha_ui.dart';

class IconBadge extends StatelessWidget {

  final int number;
  final IconData icon;

  const IconBadge({ 
    Key? key,
    required this.number,
    required this.icon
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0.0,
            right: 0.0,
            child: CircleAvatar(
              maxRadius: 9.0,
              backgroundColor: Colors.red,
              child: Text(
                number.toString(),
                style: VakinhaUi.textBold.copyWith(
                  fontSize: 9.0
                )
              )
            )
          ),
        )
      ]
    );
  }
}