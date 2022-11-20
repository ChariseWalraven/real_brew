import 'amount.dart';

class Hops {
  final String name;
  final Amount amount;
  final String add;
  final String attribute;

  Hops({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  factory Hops.fromJson(Map<String, dynamic> json) {
    return Hops(
      name: json['name'],
      amount: json['amount'],
      add: json['add'],
      attribute: json['attribute'],
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
