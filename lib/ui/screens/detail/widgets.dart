import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/text_widgets.dart';

class ContributedBy extends StatelessWidget {
  const ContributedBy(this.contributedBy, {super.key});

  final String contributedBy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contributed by: ${contributedBy.split('<')[0]}',
          ),
        ],
      ),
    );
  }
}

class BrewersTips extends StatelessWidget {
  const BrewersTips(
    this.brewersTips, {
    Key? key,
  }) : super(key: key);

  final String brewersTips;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SectionTitle("BREWER'S TIPS"),
          ),
          Text(
            brewersTips,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class FoodPairings extends StatelessWidget {
  const FoodPairings(
    this.foodPairings, {
    super.key,
  });

  final List<String> foodPairings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('FOOD PAIRINGS'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: foodPairings.length,
            itemBuilder: (context, index) => ItalicText(
              foodPairings[index],
            ),
          ),
        ],
      ),
    );
  }
}
