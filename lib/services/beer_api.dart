import 'dart:convert';

// Not sure why this warning is there. Will fix later.
// ignore: depend_on_referenced_packages
import 'package:mockito/annotations.dart';
import 'package:http/http.dart';
import 'package:real_brew/models/beer_recipe.dart';

// generate mocks class
@GenerateNiceMocks([MockSpec<BeerAPI>()])
class BeerAPI {
  final String _baseUrlString = 'https://api.punkapi.com/v2';

  Future<List<BeerRecipe>> getBeers() async {
    Uri url = Uri.parse("$_baseUrlString/beers");
    List<BeerRecipe> beers = [];

    Response response = await get(url);

    List beersJson = jsonDecode(response.body);

    for (var beerJson in beersJson) {
      BeerRecipe beerRecipe = BeerRecipe.fromJson(beerJson);
      print(beerRecipe);

      beers.add(beerRecipe);
    }

    return beers;
  }
}
