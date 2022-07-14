import 'package:flutter/material.dart';


// -----------------------------------------------------------------------------
class Logo extends StatelessWidget {
  const Logo({
    Key? key, 
    required this.titulo
  }) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,

        child:  Column(
          children: <Widget> [

            const Image(image: AssetImage('assets/tag-logo.png')),
            const SizedBox(height: 20),
            Text( this.titulo, style: const TextStyle(fontSize: 30),)

          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------