import 'package:flutter/material.dart';
import 'package:real_brew/models/malt.dart';
import 'package:real_brew/ui/widgets/text_widgets.dart';

class Malts extends StatelessWidget {
  const Malts({
    super.key,
    required this.malts,
  });

  final List malts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: malts.length,
      itemBuilder: (context, index) {
        Malt malt = malts[index];
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                width: 35,
                child: ItalicText(
                  malt.amount.value.toString(),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ItalicText(
                  malt.amount.unit,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(malt.name),
            ),
          ],
        );
      },
    );
  }
}