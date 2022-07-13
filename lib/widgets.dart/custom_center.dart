
import 'package:flutter/material.dart';


// -----------------------------------------------------------------------------
class CustomCenter extends StatelessWidget {
  const CustomCenter({
    Key? key,
    required this.childWidth,
    required this.child,
    this.color = Colors.grey, 
  }) : super(key: key);

  final double childWidth;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = ( MediaQuery.of(context).size.width - this.childWidth ) / 2.0;

    return Row(
        children: <Widget>[
          
          _SideSpacing(width: width, color: this.color),
          this.child,
          _SideSpacing(width: width, color: this.color),
          
        ]
    );
  }
}

// -----------------------------------------------------------------------------
class _SideSpacing extends StatelessWidget {
  const _SideSpacing({
    Key? key,
    required this.width, 
    required this.color,
  }) : super(key: key);

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: this.width,
      color: this.color,
    );
  }
}

// -----------------------------------------------------------------------------