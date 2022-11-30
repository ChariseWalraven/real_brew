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

class SectionTitle extends StatelessWidget {
  const SectionTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 18),
    );
  }
}