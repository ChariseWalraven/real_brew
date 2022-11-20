class Amount {
  final double value;
  final String unit;

  Amount({
    required this.value,
    required this.unit,
  });

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
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
