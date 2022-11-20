// Not sure why this warning is there. Will fix later.
// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:http/http.dart';

// generate mocks class
@GenerateNiceMocks([MockSpec<BeerAPI>()])
class BeerAPI {
  final String _baseUrlString = 'https://api.punkapi.com/v2';

  Future<List> getBeers() async {
    Uri url = Uri.parse("$_baseUrlString/beers");
    List beers = [];

    Response response = await get(url);

    beers = jsonDecode(response.body);

    return beers;
  }

  int ping() {
    return -1;
  }
}
