import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/real_brew_scaffold.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RealBrewScaffold(
      body: Text("This is the detail screen"),
    );
  }
}
