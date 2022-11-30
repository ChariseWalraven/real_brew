import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/state/beers.dart';
import 'package:real_brew/ui/screens/favourites/favourites.dart';
import 'package:real_brew/ui/screens/home_screen.dart';
import 'package:real_brew/ui/widgets/bottom_bar.dart';

class RealBrewApp extends ConsumerWidget {
  const RealBrewApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedScreenIndexRef =
        ref.watch<int>(selectedScreenIndexProvider);
    return Scaffold(
      body: SafeArea(
        child: [
          const HomeScreen(),
          const FavouritesScreen(),
        ][selectedScreenIndexRef],
      ),
      bottomNavigationBar: const RealBrewBottomBar(),
    );
  }
}
