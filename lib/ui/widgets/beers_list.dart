import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/state/beers.dart';
import 'package:real_brew/ui/screens/detail/detail_screen.dart';
import 'package:real_brew/util/constants.dart';

class BeersList extends ConsumerWidget {
  const BeersList({super.key});

  handleOnTap(BuildContext context, WidgetRef ref, BeerRecipe beer) {
    ref.read(selectedBeerProvider.notifier).state = beer;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DetailScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<BeerRecipe>> beersRef = ref.watch(beersProvider);

    return beersRef.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace, label: error.toString());
        return const Center(
          child: Text(
            style: TextStyle(color: Colors.red),
            "Oh no! Technical difficulties at the brewery! Please try again later",
          ),
        );
      },
      data: (beers) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 1.75,
          child: ListView.builder(
            itemCount: beers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              BeerRecipe beer = beers[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
                child: GestureDetector(
                    onTap: () => handleOnTap(context, ref, beer),
                    child: BeersListItem(beer: beer)),
              );
            },
          ),
        );
      },
    );
  }
}

class BeersListItem extends ConsumerWidget {
  const BeersListItem({
    Key? key,
    required this.beer,
  }) : super(key: key);

  final BeerRecipe beer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 2.5,
      alignment: Alignment.topCenter,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          isAntiAlias: true,
          fit: BoxFit.cover,
          image: AssetImage(beer.prettyImagePath),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
        child: ListTile(
          title: Text(
          style: Theme.of(context).textTheme.bodyMedium,
          widget.beer.name,
              overflow: TextOverflow.ellipsis),
      trailing: IconButton(
        onPressed: () => handleFavouriteTap(widget.beer, ref),
        icon: favouriteIcon,
      ),
    );
  }
}
