import 'package:real_brew/models/amount.dart';

class Malt {
  final String name;
  final Amount amount;

  Malt({
    required this.name,
    required this.amount,
  });

  factory Malt.fromJson(Map<String, dynamic> json) {
    return Malt(
      amount: Amount.fromJson(json['amount']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount.toJson();
    return data;
  }
}
