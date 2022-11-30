import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText(
    this.text, {
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w800,
      ),
    );
  }
}

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
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            fontSize: 18,
          ),
    );
  }
}

class TextWithReadMore extends StatefulWidget {
  const TextWithReadMore(
    this.text, {
    super.key,
  });

  final String text;

  @override
  State<TextWithReadMore> createState() => _TextWithReadMoreState();
}

class _TextWithReadMoreState extends State<TextWithReadMore> {
  bool isExpanded = false;

  void handleReadMoreOnTap() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    String readMoreOrLessText = isExpanded ? 'Read less' : 'Read more';
    return Column(
      children: [
        buildText(widget.text),
        if (widget.text.length > 120)
          GestureDetector(
            onTap: handleReadMoreOnTap,
            child: Text(
              readMoreOrLessText,
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey.shade300),
            ),
          )
      ],
    );
  }

  Widget buildText(String text) {
    final lines = isExpanded ? null : 2;
    return Text(
      text,
      maxLines: lines,
      textAlign: TextAlign.justify,
      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
