import 'package:flutter/material.dart';


// CUSTOM REUSABLE CARD
// Bunu Container seçerek flutter outline'dan right click ve extract ile yaptım
class ReusableCard extends StatelessWidget {

  // we do not need as this is for moving widgets
  // const ReusableCard({
  //   super.key,
  // });

  // we added this part and erased the key part as we do not need it
  // Now, we can change each color of the card
  final Color colour;
  final Widget? carChild; // to customize
  final VoidCallback? onPressed;
  // Angela VoidCallback yerine Function olarak type belirledi ana hata veriyor öyle
  
  ReusableCard({required this.colour, this.carChild = null, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: carChild,
      ),
    );
  }
}

