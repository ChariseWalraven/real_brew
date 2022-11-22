import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/state/riverpod_test.dart';

class ChuckJoke extends ConsumerWidget {
  const ChuckJoke({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String chuckJoke = ref.watch(testProvider);
    return Text(chuckJoke.isEmpty? "No Chuck Norris joke for you!": chuckJoke);
  }

}