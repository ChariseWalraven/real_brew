import 'dart:math';

void unimplimentedOnPress() {
  throw UnimplementedError();
}

String getRandomPrettyImagePath() {
  // Use simple hardcoded list to start.
  // There are smarter ways, but for now I
  // just need something that works.
  List<String> imagePaths = [
    'assets/images/beer_1.jpg',
    'assets/images/beer_2.jpg',
    'assets/images/beer_3.jpg',
    'assets/images/beer_4.jpg',
    'assets/images/beer_5.jpg',
    'assets/images/beer_6.jpg',
    'assets/images/beer_7.jpg',
    'assets/images/beer_8.jpg',
    'assets/images/beer_9.jpg',
    'assets/images/beer_10.jpg',
  ];

  int randomIndex = Random().nextInt(imagePaths.length);

  return imagePaths[randomIndex];
}
