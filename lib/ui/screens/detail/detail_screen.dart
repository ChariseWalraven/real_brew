import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/models.dart' as m;
import 'package:real_brew/state/beers.dart';
import 'package:real_brew/ui/widgets/beers_widgets.dart';
import 'package:real_brew/util/colours.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedBeerProviderRef = ref.watch(selectedBeerProvider);

    Widget content = selectedBeerProviderRef != null
        ? _DetailScreenContents(beerRecipe: selectedBeerProviderRef)
        : const _NoBeerRecipeProvided();
    return RealBrewScaffold(
      body: content,
    );
  }
}

class _DetailScreenContents extends StatelessWidget {
  const _DetailScreenContents({
    Key? key,
    required this.beerRecipe,
  }) : super(key: key);

  final m.BeerRecipe beerRecipe;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        BeerBackgroundImage(beerRecipe: beerRecipe),
        BeerRecipeDetail(
            size: size, beerRecipe: beerRecipe, textTheme: textTheme)
      ],
    );
  }
}

class BeerRecipeDetail extends StatelessWidget {
  const BeerRecipeDetail({
    Key? key,
    required this.size,
    required this.beerRecipe,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final m.BeerRecipe beerRecipe;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            cyberGrape,
            darkPurple,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                beerRecipe.name,
                style: textTheme.displaySmall,
              ),
              Text(beerRecipe.tagline),
              StatsRow(
                abv: beerRecipe.abv,
                ph: beerRecipe.ph,
                volume: beerRecipe.volume,
              ),
              Ingredients(beerRecipe: beerRecipe),
              Method(method: beerRecipe.method),
            ],
          ),
        ),
      ),
    );
  }
}

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

class _NoBeerRecipeProvided extends StatelessWidget {
  const _NoBeerRecipeProvided({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
