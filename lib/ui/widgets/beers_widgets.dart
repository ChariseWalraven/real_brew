import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/state/beers.dart';

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
            return Text(beer.name);
          },
        );
      },
    );
  }
}
