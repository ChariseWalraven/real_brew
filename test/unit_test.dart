import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:real_brew/models/amount.dart';
import 'package:real_brew/models/beer_recipe.dart';
import 'package:real_brew/models/hop.dart';
import 'package:real_brew/models/ingredients.dart';
import 'package:real_brew/models/volume.dart';

import 'package:real_brew/services/beer_api.mocks.dart';
import 'package:real_brew/services/beer_api.dart';

import 'dummy_data/dummy_data.dart';
import 'test.settings.dart';

void main() async {
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
      Amount dummyAmount = Amount.fromJson(jsonDecode(dummyAmountData));
      test('Has a value of type double', () {
        expect(dummyAmount.value.runtimeType, double);
      });
      test('Has a unit of type String', () {
        expect(dummyAmount.unit.runtimeType, String);
      });
    });

    group('Hop', () {
      Hop dummyHops = Hop.fromJson(jsonDecode(dummyHopsData));
      test('Has property name of type String.', () {
        expect(dummyHops.name.runtimeType, String);
      });
      test('Has property amount of type Amount.', () {
        expect(dummyHops.amount.runtimeType, Amount);
      });
      test('Has property add of type String.', () {
        expect(dummyHops.add.runtimeType, String);
      });
      test('Has property attribute of type String.', () {
        expect(dummyHops.attribute.runtimeType, String);
      });
    });

    group('Ingredients', () {
      Ingredients dummyIngredients =
          Ingredients.fromJson(jsonDecode(dummyIngredientsData));
      test('Has property malt of type List<Malt>.', () {
        expect(dummyIngredients.malt.runtimeType, List<Malt>);
      });
      test('Has property hops of type List<Hops>.', () {
        expect(dummyIngredients.hops.runtimeType, List<Hop>);
      });
      test('Has property yeast of type String.', () {
        expect(dummyIngredients.yeast.runtimeType, String);
      });
    });

    group('Volume', () {
      Volume dummyVolume = Volume.fromJson(jsonDecode(dummyVolumeData));

      test('Has a value of type double', () {
        expect(dummyVolume.value.runtimeType, int);
      });

      test('Has a unit of type String', () {
        expect(dummyVolume.unit.runtimeType, String);
      });
    });
  });
}
