import 'package:flutter/material.dart';
import '../constants.dart';



class IconContent extends StatelessWidget {

  final String cardText;
  final IconData cardIcon;
  IconContent({required this.cardText, required this.cardIcon});


  @override
  Widget build(BuildContext context) {
    return Column(
      // MALE Text ve Mars icon ortalasın diye yaptık
      // Yatayda ortalıyor ama column'ın dikeyde ortasına getirmiyor
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, size: 80.0),
        SizedBox(height: 15.0),
        Text(
            cardText,
            style: kLabelTextStyle )
      ],
    );
  }
}