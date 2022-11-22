import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/state/riverpod_test.dart';

class ChuckJoke extends ConsumerWidget {
  const ChuckJoke({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String chuckJoke = ref.watch(testProvider);
    return Text(
        chuckJoke.isEmpty ? "No Chuck Norris joke for you!" : chuckJoke);
  }
}

class ChuckJokes extends ConsumerWidget {
  const ChuckJokes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Joke> jokes = ref.watch(stateProviderTest);
    return JokesList(jokes: jokes);
  }
}

class JokesList extends StatelessWidget {
  const JokesList({
    Key? key,
    required this.jokes,
  }) : super(key: key);

  final List<Joke> jokes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        final joke = jokes[index];
        return ListTile(
          title: Text(joke.text),
        );
      },
    );
  }
}

class SpinnerThenChuckJoke extends ConsumerWidget {
  const SpinnerThenChuckJoke({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Joke>> jokes = ref.watch(futureProviderTest);

    return jokes.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
        data: (jokes) {
          return JokesList(jokes: jokes);
        });
  }
}
