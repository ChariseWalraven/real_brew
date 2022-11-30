import 'package:flutter/material.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/models/hop.dart';
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

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key? key,
    required this.beerRecipe,
  }) : super(key: key);

  final BeerRecipe beerRecipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SectionTitle('INGREDIENTS'),
        IngredientRow(
          'Malt',
          child: Malts(
            malts: beerRecipe.ingredients.malt,
          ),
        ),
        if (beerRecipe.ingredients.hops.isNotEmpty)
          IngredientRow(
            'Hops',
            child: Hops(beerRecipe.ingredients.hops),
          ),
      ],
    );
  }
}

class Hops extends StatelessWidget {
  const Hops(
    this.hops, {
    Key? key,
  }) : super(key: key);

  final List<Hop> hops;

  @override
  Widget build(BuildContext context) {
    final List<Hop> startHops = _filterHops(hops, 'start');
    final List<Hop> middleHops = _filterHops(hops, 'middle');
    final List<Hop> endHops = _filterHops(hops, 'end');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (startHops.isNotEmpty) const ItalicText('Start:'),
        if (startHops.isNotEmpty) HopList(hops: startHops),
        if (middleHops.isNotEmpty) const ItalicText('Middle:'),
        if (middleHops.isNotEmpty) HopList(hops: middleHops),
        if (endHops.isNotEmpty) const ItalicText('End:'),
        if (endHops.isNotEmpty) HopList(hops: endHops),
      ],
    );
  }

  List<Hop> _filterHops(List<Hop> hops, String add) =>
      hops.where((Hop hop) => hop.add == add).toList();
}

class HopList extends StatelessWidget {
  const HopList({
    Key? key,
    required this.hops,
  }) : super(key: key);

  final List<Hop> hops;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 10),
      shrinkWrap: true,
      itemCount: hops.length,
      itemBuilder: (context, index) {
        Hop hop = hops[index];
        return Text(
            '${hop.amount.value} ${hop.amount.unit} ${hop.name} (${hop.attribute})');
      },
    );
  }
}

class IngredientRow extends StatelessWidget {
  const IngredientRow(
    this.title, {
    super.key,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IngredientTitle(title),
          child,
        ],
      ),
    );
  }
}

class IngredientTitle extends StatelessWidget {
  const IngredientTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}