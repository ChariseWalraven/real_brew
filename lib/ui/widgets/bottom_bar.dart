import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/state/beers.dart';

class RealBrewBottomBar extends ConsumerWidget {
  const RealBrewBottomBar({super.key});

  void handleNavigation(
      BuildContext context, WidgetRef ref, int selectedIndex) {
    ref.read(selectedScreenIndexProvider.notifier).state = selectedIndex;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedScreenIndexRef = ref.watch<int>(selectedScreenIndexProvider);
    return NavigationBar(
      height: 60,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.sports_bar),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          label: '',
        ),
      ],
      selectedIndex: selectedScreenIndexRef,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      surfaceTintColor: Colors.deepPurple,
      onDestinationSelected: ((int selectedIndex) =>
          handleNavigation(context, ref, selectedIndex)),
    );
  }
}
