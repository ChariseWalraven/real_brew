import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/services/beer_api.dart';

final beersProvider = FutureProvider((ref) async => await BeerAPI().getBeers());

final selectedBeerProvider = StateProvider<BeerRecipe?>((ref) => null);

final selectedScreenIndexProvider = StateProvider<int>((ref) => 0);
