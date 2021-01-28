import 'package:flutter/material.dart';

class Badge extends StatelessWidget {



  final Widget child;
  final String value;
  final Color color;

  const Badge({
  @required this.value, this.color, 
  @required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Colors.black87),
            constraints: BoxConstraints(
              minWidth:6,
              minHeight:6
            ),
            child: Text(value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 8),),
          )
        )
      ],);
  }
}