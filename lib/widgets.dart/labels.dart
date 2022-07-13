import 'package:flutter/material.dart';


// -----------------------------------------------------------------------------
class Labels extends StatelessWidget {
  const Labels({
    Key? key, 
    required this.title, 
    required this.subTitle,
    required this.route, 
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Column(
        children:  <Widget>[
          
          Text( this.title, style: const TextStyle(
            color: Colors.black54, 
            fontSize: 15, 
            fontWeight: FontWeight.w300)),
            
          const SizedBox(height: 10,),

          GestureDetector(
            child: Text( this.subTitle, 
              style: TextStyle(
                color: Colors.blue[600], 
                fontWeight: FontWeight.bold,
                fontSize: 18
            )),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.route);
            },
          )

        ]
      );
  }
}
// -----------------------------------------------------------------------------