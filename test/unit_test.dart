import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:real_brew/services/beer_api.mocks.dart';
import 'package:real_brew/services/beer_api.dart';

import 'test.settings.dart';

void main() {
  group('Services', () {
    group('BeerAPI', () {
      BeerAPI beerAPI = BeerAPI();

      // setup mocks if using
      if (kMockBeerAPI) {
        beerAPI = MockBeerAPI();

        when(beerAPI.getBeers()).thenReturn(
          Future.delayed(
            const Duration(milliseconds: 5),
            () => List.filled(25, ''),
          ),
        );
      }
      group('.getBeers', () {
        test('Should return a List', () async {
          expect(await beerAPI.getBeers(), isList);
        });
        test('With 25 items', () async {
          var result = await beerAPI.getBeers();
          expect(result.length, 25);
        });
      });
    });
  });
}
