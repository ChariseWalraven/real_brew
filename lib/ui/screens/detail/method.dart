import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/text_widgets.dart';
import 'package:real_brew/models/models.dart' as m;

class Method extends StatelessWidget {
  const Method({
    Key? key,
    required this.method,
  }) : super(key: key);
  final m.Method method;

  @override
  Widget build(BuildContext context) {
    // use the first mash temp because most recipes only have one. Potential for having a list later.
    final m.MashTemp firstMashTemp = method.mashTemp.first;
    final m.Fermentation fermentation = method.fermentation;
    return Column(
      children: [
        const SectionTitle('METHOD'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BoldText(
              'Mash Temp:',
              fontWeight: FontWeight.w700,
            ),
            Text(
                '${firstMashTemp.temp.value} ${firstMashTemp.temp.unit} | ${firstMashTemp.duration} min')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BoldText(
              'Fermentation:',
              fontWeight: FontWeight.w700,
            ),
            Text('${fermentation.temp.value}° ${fermentation.temp.unit}')
          ],
        ),
        if (method.twist != null && method.twist!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              runSpacing: 5,
              children: [
                const BoldText(
                  'Twist',
                  fontWeight: FontWeight.w700,
                ),
                Text(
                  method.twist!,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
      ],
    );
  }
}
