import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:real_brew/models/models.dart';

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

        when(beerAPI.getBeers()).thenReturn(
          Future.delayed(
            const Duration(milliseconds: 5),
            () => List.filled(
                25, BeerRecipe.fromJson(jsonDecode(dummyBeerRecipeData))),
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

    group('Fermentation', () {
      Fermentation dummyFermentation =
          Fermentation.fromJson(jsonDecode(dummyFermentationData));
      test('Has property volume of type Volume', () {
        expect(dummyFermentation.temp.runtimeType, Volume);
      });
    });

    group('MashTemp', () {
      MashTemp dummyMashTemp = MashTemp.fromJson(jsonDecode(dummyMashTempData));
      test('Has property mashTemp of type Volume', () {
        expect(dummyMashTemp.temp.runtimeType, Volume);
      });
      test('Has property duration of type int', () {
        expect(dummyMashTemp.duration.runtimeType, int);
      });
    });

    group('Method', () {
      Method dummyMethod = Method.fromJson(jsonDecode(dummyMethodData));
      test('Has property mashTemp of type List<MashTemp>', () {
        expect(dummyMethod.mashTemp.runtimeType, List<MashTemp>);
      });
      test('Has property fermentation of type Fermentation', () {
        expect(dummyMethod.fermentation.runtimeType, Fermentation);
      });
      test('Has property twist of type String', () {
        expect(
          dummyMethod.twist.runtimeType.toString(),
          matches(
            RegExp(r'(String|Null)'),
          ),
        );
      });
    });

    group('BeerRecipe', () {
      BeerRecipe dummyBeerRecipe =
          BeerRecipe.fromJson(jsonDecode(dummyBeerRecipeData));

      test('Has property id of type int.', () {
        expect(dummyBeerRecipe.id.runtimeType, int);
      });
      test('Has property name of type String.', () {
        expect(dummyBeerRecipe.name.runtimeType, String);
      });
      test('Has property tagline of type String.', () {
        expect(dummyBeerRecipe.tagline.runtimeType, String);
      });
      test('Has property firstBrewed of type String.', () {
        expect(dummyBeerRecipe.firstBrewed.runtimeType, String);
      });
      test('Has property description of type String.', () {
        expect(dummyBeerRecipe.description.runtimeType, String);
      });
      test('Has property imageUrl of type String.', () {
        expect(dummyBeerRecipe.imageUrl.runtimeType, String);
      });
      test('Has property abv of type double.', () {
        expect(dummyBeerRecipe.abv.runtimeType, double);
      });
      test('Has property abv of type double.', () {
        expect(dummyBeerRecipe.abv.runtimeType, double);
      });
      test('Has property ibu of type double.', () {
        expect(dummyBeerRecipe.ibu.runtimeType, double);
      });
      test('Has property targetFg of type double.', () {
        expect(dummyBeerRecipe.targetFg.runtimeType, double);
      });
      test('Has property targetOg of type double.', () {
        expect(dummyBeerRecipe.targetOg.runtimeType, double);
      });
      test('Has property ebc of type double.', () {
        expect(dummyBeerRecipe.ebc.runtimeType, double);
      });
      test('Has property srm of type double.', () {
        expect(dummyBeerRecipe.srm.runtimeType, double);
      });
      test('Has property ph of type double.', () {
        expect(dummyBeerRecipe.ph.runtimeType, double);
      });
      test('Has property attenuationLevel of type double.', () {
        expect(dummyBeerRecipe.attenuationLevel.runtimeType, double);
      });
      test('Has property volume of type Volume.', () {
        expect(dummyBeerRecipe.volume.runtimeType, Volume);
      });
      test('Has property boilVolume of type Volume.', () {
        expect(dummyBeerRecipe.boilVolume.runtimeType, Volume);
      });
      test('Has property method of type Method.', () {
        expect(dummyBeerRecipe.method.runtimeType, Method);
      });
      test('Has property ingredients of type Ingredients.', () {
        expect(dummyBeerRecipe.ingredients.runtimeType, Ingredients);
      });
      test('Has property foodPairing of type List<String>.', () {
        expect(dummyBeerRecipe.foodPairing.runtimeType, List<String>);
      });
      test('Has property brewersTips of type String.', () {
        expect(dummyBeerRecipe.brewersTips.runtimeType, String);
      });
      test('Has property contributedBy of type String.', () {
        expect(dummyBeerRecipe.contributedBy.runtimeType, String);
      });
    });
  });
}
