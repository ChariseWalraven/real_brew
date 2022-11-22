class Volume {
  final int value;
  final String unit;

  Volume({
    required this.value,
    required this.unit,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      unit: json['unit'] as String,
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}
