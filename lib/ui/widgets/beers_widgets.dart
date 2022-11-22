import 'package:flutter/material.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/services/beer_api.dart';

class BeersList extends StatelessWidget {
  const BeersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BeerAPI().getBeers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<BeerRecipe> beers = snapshot.data!;
            return ListView.builder(
              itemCount: beers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                BeerRecipe beer = beers[index];
                return Text(beer.name);
              },
            );
          }
          return Container();
        });
  }
}
