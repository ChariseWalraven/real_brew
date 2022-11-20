import 'package:mockito/annotations.dart';

// generate mocks class
@GenerateNiceMocks([MockSpec<BeerAPI>()])
class BeerAPI {

  List getBeers() {
    List beers = [];
    return beers;
  }

  int ping() {
    return -1;
  }
}
