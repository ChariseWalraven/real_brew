import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:real_brew/services/beer_api.mocks.dart';
// import 'package:real_brew/services/beer_api.dart';

void main() {
  group('Services', () {
    group('BeerAPI', () {
      final MockBeerAPI beerAPI = MockBeerAPI();
      group('.ping', () {
        test('Should return -1', () {
          when(beerAPI.ping()).thenReturn(-1);
          expect(beerAPI.ping(), -1);
        });
      });
      group('.getBeers', () {
        when(beerAPI.getBeers()).thenReturn(List.filled(25, ''));
        var getBeersResult = beerAPI.getBeers();
        test('Should return a List', () {
          expect(getBeersResult, isList);
        });
        test('With 25 items', () {
          expect(getBeersResult.length, equals(25));
        });
      });
    });
  });
}
