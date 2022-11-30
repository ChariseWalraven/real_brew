import 'package:flutter/material.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/models/volume.dart';

export 'beers_list.dart';
export '../screens/detail/ingredients.dart';
export 'text_widgets.dart';
export 'real_brew_scaffold.dart';

class BeerBackgroundImage extends StatelessWidget {
  const BeerBackgroundImage({
    Key? key,
    required this.beerRecipe,
  }) : super(key: key);

  final BeerRecipe beerRecipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(beerRecipe.prettyImagePath),
        ),
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({
    Key? key,
    required this.ph,
    required this.abv,
    required this.volume,
  }) : super(key: key);

  final double ph;
  final double abv;
  final Volume volume;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stat(
            statTitle: 'PH',
            statText: ph.toString(),
          ),
          const _CustomDivider(),
          Stat(
            statText: abv.toString(),
            statTitle: 'STRENGTH',
          ),
          const _CustomDivider(),
          Stat(
            statText: '${volume.value} ${volume.unit}',
            statTitle: 'VOLUME',
          ),
        ],
      ),
    );
  }
}

class Stat extends StatelessWidget {
  const Stat({
    Key? key,
    required this.statText,
    required this.statTitle,
  }) : super(key: key);

  final String statText;
  final String statTitle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            statTitle,
            style: textTheme.labelMedium,
          ),
          Text(
            statText,
            style: TextStyle(
              color: Colors.yellow.shade100,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
      ),
    );
  }
}
