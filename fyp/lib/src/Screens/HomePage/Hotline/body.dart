import 'package:flutter/material.dart';

class StateText extends StatelessWidget {
  const StateText({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Position extends StatelessWidget {
  const Position({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        height: 90,
        width: 90,
        child: Image.asset('$image'),
      ),
    );
  }
}
