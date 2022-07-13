import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  const BotonAzul({Key? key, 
    required this.text, 
    required this.onPressed
  }) : super(key: key);
  
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        primary: Colors.blue,
        shape: const StadiumBorder()
      ),
      onPressed:  onPressed,  
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(text, style: const TextStyle(fontSize: 17),),
        ),
      )
    );
  }
}