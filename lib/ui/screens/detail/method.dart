import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/text_widgets.dart';
import 'package:real_brew/models/models.dart' as m;
import 'package:real_brew/util/constants.dart';

class Method extends StatelessWidget {
  const Method({
    Key? key,
    required this.method,
  }) : super(key: key);
  final m.Method method;

  @override
  Widget build(BuildContext context) {
    final m.Fermentation fermentation = method.fermentation;
    // use the first mash temp because most recipes only have one. Potential for having a list later.
    final String mashTempText = _formatMashTempText(method.mashTemp.first);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kVerticalSpacing),
            child: SectionTitle('METHOD'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BoldText(
                'Mash Temp:',
                fontWeight: FontWeight.w700,
              ),
              Text(mashTempText)
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
              padding: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
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
      ),
    );
  }

  String _formatMashTempText(m.MashTemp firstMashTemp) {
    String mashTempText =
        '${firstMashTemp.temp.value}° ${firstMashTemp.temp.unit}';
    if (firstMashTemp.duration > 0) {
      mashTempText += ' | ${firstMashTemp.duration} min';
    }
    return mashTempText;
  }
}
