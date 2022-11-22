import 'package:real_brew/models/volume.dart';

class MashTemp {
  final Volume temp;
  final int duration;

  MashTemp({
    required this.temp,
    required this.duration,
  });

  factory MashTemp.fromJson(Map<String, dynamic> json) {
    return MashTemp(
      temp: Volume.fromJson(json['temp']),
      duration: json['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp.toJson();
    data['duration'] = duration;
    return data;
  }
}
