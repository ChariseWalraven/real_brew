import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/state/beers.dart';
import 'package:real_brew/ui/widgets/real_brew_scaffold.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedBeerProviderRef = ref.watch(selectedBeerProvider);
    return RealBrewScaffold(
      body: Text(selectedBeerProviderRef != null
          ? "This is the detail screen. The given beer id is ${selectedBeerProviderRef.id}"
          : "This is the detail screen. No beer id was given"),
    );
  }
}
