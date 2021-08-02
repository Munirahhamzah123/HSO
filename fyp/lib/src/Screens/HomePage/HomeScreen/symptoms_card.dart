import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          child: Image.asset('$image'),
        ),
        SizedBox(height: 5),
        Text(
          '$title',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
