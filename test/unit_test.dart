import 'package:flutter_test/flutter_test.dart';
import 'package:real_brew/services/beer_api.dart';

void main() {
  group('Services', () {
    group('BeerAPI', () {
      final BeerAPI beerAPI = BeerAPI();
      group('.getBeers', () {
        var getBeersResult = beerAPI.getBeers();
        test('Should return a List', () {
          expect(getBeersResult, isList);
          // expect(getBeersResult.length, equals(25));
        });
        test('With 25 items', () {
          expect(getBeersResult.length, equals(25));
        });
      });
    });
  });
}
