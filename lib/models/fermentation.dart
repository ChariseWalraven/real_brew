import 'package:real_brew/models/volume.dart';

class Fermentation {
  final Volume temp;

  Fermentation({
    required this.temp,
  });

  factory Fermentation.fromJson(Map<String, dynamic> json) {
    return Fermentation(
      temp: Volume.fromJson(json['temp']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp.toJson();
    return data;
  }
}
