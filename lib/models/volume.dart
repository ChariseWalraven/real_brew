class Volume {
  final int value;
  final String unit;

  Volume({
    required this.value,
    required this.unit,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      unit: json['unit'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}
