import 'amount.dart';

class Hop {
  final String name;
  final Amount amount;
  final String add;
  final String attribute;

  Hop({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  factory Hop.fromJson(Map<String, dynamic> json) {
    return Hop(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount']),
      add: json['add'] as String,
      attribute: json['attribute'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount.toJson();
    data['add'] = add;
    data['attribute'] = attribute;
    return data;
  }
}
