import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/state/beers.dart';
import 'package:real_brew/util/functions.dart';

class BeersList extends ConsumerWidget {
  const BeersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<BeerRecipe>> beersRef = ref.watch(beersProvider);

    return beersRef.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace, label: error.toString());
        return const Text(
          style: TextStyle(color: Colors.red),
          "Oh no! Technical difficulties at the brewery! Please try again later",
        );
      },
      data: (beers) {
        return ListView.builder(
          itemCount: beers.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            BeerRecipe beer = beers[index];
            return BeersListItem(beer: beer);
          },
        );
      },
    );
  }
}

class BeersListItem extends StatelessWidget {
  const BeersListItem({
    Key? key,
    required this.beer,
  }) : super(key: key);

  final BeerRecipe beer;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return SizedBox(
      child: Container(
        height: screenSize.height / 2.5,
        width: screenSize.width / 2,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(beer.imageUrl))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(style: theme.textTheme.bodyMedium, beer.name),
            const IconButton(
              onPressed: unimplimentedOnPress,
              icon: Icon(Icons.favorite_border),
            ),
          ],
        ),
      ),
    );
  }
}
