import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Chuck norris joke courtesy of https://api.chucknorris.io/
final testProvider = Provider<String>((_) =>
    'When Alexander Bell invented the telephone, he had 3 missed calls from Chuck Norris.');

class Joke {
  Joke({required this.text, required this.funnyLevel});

  final String text;
  final FunnyLevel funnyLevel;
}

final _jokes = [
  Joke(
    text: "Chuck Norris can reverse Convection",
    funnyLevel: FunnyLevel.oneSnort,
  ),
  Joke(
    text:
        "Electronic microscope pictures of the Y chromosome are just tiny photos of Chuck Norris",
    funnyLevel: FunnyLevel.okThatOnesPrettyFunny,
  ),
  Joke(
    text: "Chuck Norris' sombrero is over fifteen feet in diameter.",
    funnyLevel: FunnyLevel.iAmMakingLaughingNoisesButItsNotActuallyFunny,
  ),
  Joke(
    text:
        "Chuck Norris doesn't use a microwave to pop his popcorn. He simply sits the package on the counter and the kernels jump in fear of a round house kick",
    funnyLevel: FunnyLevel.wowMoreThanOneLaugh,
  ),
];

enum FunnyLevel {
  iAmMakingLaughingNoisesButItsNotActuallyFunny,
  oneSnort,
  okThatOnesPrettyFunny,
  wowMoreThanOneLaugh,
  soFunnyItsHardToBreathe,
  dead,
}

final stateProviderTest = StateProvider<List<Joke>>((ref) => _jokes);

final futureProviderTest = FutureProvider<List<Joke>>(
  (ref) => Future.delayed(const Duration(seconds: 3), () => _jokes),
);
