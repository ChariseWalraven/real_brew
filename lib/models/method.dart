import 'package:real_brew/models/fermentation.dart';
import 'package:real_brew/models/mash_temp.dart';

class Method {
  final List<MashTemp> mashTemp;
  final Fermentation fermentation;
  final String? twist;

  Method({
    required this.mashTemp,
    required this.fermentation,
    this.twist,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    List<MashTemp> mashTemp = List.castFrom(json[
        'mash_temp']); // I think this will create a list of mash temps, but I'm not sure...Will have to test

    return Method(
      mashTemp: mashTemp,
      fermentation: Fermentation.fromJson(json['fermentation']),
      twist: json['twist'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mash_temp'] = mashTemp.map((v) => v.toJson()).toList();
    data['fermentation'] = fermentation.toJson();
    data['twist'] = twist;
    return data;
  }
}
