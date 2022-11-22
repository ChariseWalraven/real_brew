import 'package:real_brew/models/hop.dart';
import 'package:real_brew/models/malt.dart';

class Ingredients {
  final List<Malt> malt;
  final List<Hop> hops;
  final String yeast;

  Ingredients({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    List maltJson = json['malt'];
    List hopsJson = json['hops'];
    List<Malt> malt = maltJson.map((mJson) => Malt.fromJson(mJson)).toList();
    List<Hop> hops = hopsJson.map((hJson) => Hop.fromJson(hJson)).toList();

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
