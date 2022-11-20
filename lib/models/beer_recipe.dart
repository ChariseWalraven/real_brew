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
  final int ibu;
  final int targetFg;
  final int targetOg;
  final int ebc;
  final int srm;
  final double ph;
  final int attenuationLevel;
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
    return BeerRecipe(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      firstBrewed: json['firstBrewed'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      abv: json['abv'],
      ibu: json['ibu'],
      targetFg: json['targetFg'],
      targetOg: json['targetOg'],
      ebc: json['ebc'],
      srm: json['srm'],
      ph: json['ph'],
      attenuationLevel: json['attenuationLevel'],
      volume: json['volume'],
      boilVolume: json['boilVolume'],
      method: json['method'],
      ingredients: json['ingredients'],
      foodPairing: json['foodPairing'],
      brewersTips: json['brewersTips'],
      contributedBy: json['contributedBy'],
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
