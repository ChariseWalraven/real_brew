import 'package:real_brew/models/hops.dart';
import 'package:real_brew/models/malt.dart';

class Ingredients {
  final List<Malt> malt;
  final List<Hops> hops;
  final String yeast;

  Ingredients({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    List<Malt> malt = List.castFrom(json['malt']);
    List<Hops> hops = List.castFrom(json['hops']);

    return Ingredients(
      malt: malt,
      hops: hops,
      yeast: json['yeast'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['malt'] = malt.map((v) => v.toJson()).toList();
    data['hops'] = hops.map((v) => v.toJson()).toList();
    data['yeast'] = yeast;
    return data;
  }
}
