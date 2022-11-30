import 'package:flutter/material.dart';

class ItalicText extends StatelessWidget {
  const ItalicText(
    this.text, {
    Key? key,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontStyle: FontStyle.italic),
      textAlign: textAlign,
    );
  }
}