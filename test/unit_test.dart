import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:real_brew/models/amount.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/models/volume.dart';

import 'package:real_brew/services/beer_api.mocks.dart';
import 'package:real_brew/services/beer_api.dart';

import 'test.settings.dart';

void main() async {
  // if I don't use this, the dummy data isn't loaded.
  // I'm sure there's a better way, but I don't know it yet.
  TestWidgetsFlutterBinding.ensureInitialized();

  String dummyAmountFile =
      await rootBundle.loadString('assets/dummy_data/dummyAmount.json');
  String dummyVolumeFile =
      await rootBundle.loadString('assets/dummy_data/dummyVolume.json');

  group('Services', () {
    group('BeerAPI', () {
      BeerAPI beerAPI = BeerAPI();

      // setup mocks if using
      if (kMockBeerAPI) {
        beerAPI = MockBeerAPI();

        // TODO: fix
        // when(beerAPI.getBeers()).thenReturn(
        //   Future.delayed(
        //     const Duration(milliseconds: 5),
        //     () => List.filled(25, BeerRecipe.fromJson(dummyBeerRecipeJson)),
        //   ),
        // );
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
  group('Models', () {
    group('Amount', () {
      Amount dummyAmount = Amount.fromJson(jsonDecode(dummyAmountFile));
      test('Has a value of type double', () {
        expect(dummyAmount.value.runtimeType, double);
      });
      test('Has a unit of type String', () {
        expect(dummyAmount.unit.runtimeType, String);
      });
    });
    // TODO
    group('Fermentation', () {});
    // TODO
    group('Hops', () {});
    // TODO
    group('Ingredients', () {});

    group('Volume', () {
      Volume dummyVolume = Volume.fromJson(jsonDecode(dummyVolumeFile));

      test('Has a value of type double', () {
        expect(dummyVolume.value.runtimeType, int);
      });

      test('Has a unit of type String', () {
        expect(dummyVolume.unit.runtimeType, String);
      });
    });
  });
}
