import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/widgets.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Favourites',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Text('Test'),
          ),
        )
      ],
    );
  }
}
