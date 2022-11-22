import 'dart:convert';

import 'package:real_brew/models/ingredients.dart';
import 'package:real_brew/models/method.dart';
import 'package:real_brew/models/volume.dart';

class BeerRecipe {
  final int id;
  final String name;
  final String tagline;
  final String firstBrewed;
  final String description;
  final String imageUrl;
  final double abv;
  final double ibu;
  final double targetFg;
  final double targetOg;
  final double ebc;
  final double srm;
  final double ph;
  final double attenuationLevel;
  final Volume volume;
  final Volume boilVolume;
  final Method method;
  final Ingredients ingredients;
  final List<String> foodPairing;
  final String brewersTips;
  final String contributedBy;

  BeerRecipe({
    required this.id,
    required this.name,
    required this.tagline,
    required this.firstBrewed,
    required this.description,
    required this.imageUrl,
    required this.abv,
    required this.ibu,
    required this.targetFg,
    required this.targetOg,
    required this.ebc,
    required this.srm,
    required this.ph,
    required this.attenuationLevel,
    required this.volume,
    required this.boilVolume,
    required this.method,
    required this.ingredients,
    required this.foodPairing,
    required this.brewersTips,
    required this.contributedBy,
  });

  factory BeerRecipe.fromJson(Map<String, dynamic> json) {
    double abv = double.parse((json['abv'] ?? 0.0).toString());
    double ibu = double.parse((json['ibu'] ?? 0.0).toString());
    double targetFg = double.parse((json['targetFg'] ?? 0.0).toString());
    double targetOg = double.parse((json['targetOg'] ?? 0.0).toString());
    double ebc = double.parse((json['ebc'] ?? 0.0).toString());
    double srm = double.parse((json['srm'] ?? 0.0).toString());
    double ph = double.parse((json['ph'] ?? 0.0).toString());
    double attenuationLevel =
        double.parse((json['attenuationLevel'] ?? 0.0).toString());

    return BeerRecipe(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      firstBrewed: json['first_brewed'],
      description: json['description'],
      imageUrl: json['image_url'],
      abv: abv,
      ibu: ibu,
      targetFg: targetFg,
      targetOg: targetOg,
      ebc: ebc,
      srm: srm,
      ph: ph,
      attenuationLevel: attenuationLevel,
      volume: Volume.fromJson(json['volume']),
      boilVolume: Volume.fromJson(json['boil_volume']),
      method: Method.fromJson(json['method']),
      ingredients: Ingredients.fromJson(json['ingredients']),
      foodPairing: List<String>.from(json['food_pairing']),
      brewersTips: json['brewers_tips'],
      contributedBy: json['contributed_by'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['first_brewed'] = firstBrewed;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['abv'] = abv;
    data['ibu'] = ibu;
    data['target_fg'] = targetFg;
    data['target_og'] = targetOg;
    data['ebc'] = ebc;
    data['srm'] = srm;
    data['ph'] = ph;
    data['attenuation_level'] = attenuationLevel;
    data['volume'] = volume.toJson();
    data['boil_volume'] = boilVolume.toJson();
    data['method'] = method.toJson();
    data['ingredients'] = ingredients.toJson();
    data['food_pairing'] = foodPairing;
    data['brewers_tips'] = brewersTips;
    data['contributed_by'] = contributedBy;
    return data;
  }
}
