import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const RealBrewScaffold(
      body: Text('This is the favourites page'),
    );
  }
}
