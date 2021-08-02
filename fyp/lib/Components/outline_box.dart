import 'package:flutter/material.dart';
import 'package:fyp/Components/text_field_container.dart';
import 'package:fyp/constants.dart';

class OutlineBox extends StatelessWidget {
  final String hintText, labelText;
  final ValueChanged<String> onChanged;
  final Color color, textColor;
  const OutlineBox({
    Key key,
    this.hintText,
    this.onChanged,
    this.color = kPrimarySecondColor,
    this.textColor = Colors.black,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
