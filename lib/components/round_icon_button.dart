import 'package:flutter/material.dart';
import '../constants.dart';


//customized widget
class RoundIconButton extends StatelessWidget {
  //const RoundIconButton({Key? key}) : super(key: key);

  final IconData icon;
  final VoidCallback action;

  RoundIconButton({required this.icon, required this.action});


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

        child: Icon(icon),
        elevation: 0.0,
        shape: CircleBorder(),
        constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
        fillColor: Color(0xFF4C4F5E),
        onPressed: action);
  }
}
