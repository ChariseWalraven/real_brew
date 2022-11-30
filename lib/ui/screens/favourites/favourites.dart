import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/state/beers.dart';
import 'package:real_brew/ui/widgets/beers_list.dart';

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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              shrinkWrap: true,
              itemCount: favouriteBeers.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: BeersListItem(
                  beer: favouriteBeers[index],
                ),
              ),
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
