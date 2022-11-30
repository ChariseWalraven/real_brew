import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/state/beers.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<BeerRecipe> favouriteBeers = ref.watch(favouriteBeersProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favourites',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        if (favouriteBeers.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: favouriteBeers.length,
              itemBuilder: (context, index) => Text(favouriteBeers[index].name),
            ),
          )
        else
          const Text(
            "You don't have any favourites yet. :( Try favouriting something.",
          )
      ],
    );
  }
}
