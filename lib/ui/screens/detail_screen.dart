import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/models/hop.dart';
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

  final BeerRecipe beerRecipe;

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
  final BeerRecipe beerRecipe;
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Ingredients(beerRecipe: beerRecipe),
                  )
                ],
              )
            ],
          ),
        ),
      ),
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

class _NoBeerRecipeProvided extends StatelessWidget {
  const _NoBeerRecipeProvided({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
