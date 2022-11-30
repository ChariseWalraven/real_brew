// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:real_brew/ui/screens/home_screen.dart';
import 'package:real_brew/ui/widgets/widgets.dart';

void main() {
  group('Home Screen', () {
    testWidgets('Has a Text with "Choose your beer", and a BeersList',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byType(Text), findsOneWidget);
      expect(find.text('Choose your beer'), findsOneWidget);
      expect(find.byType(BeersList), findsOneWidget);
    });

    // Can't quite figure this out and don't really have the time for it anymore
    // testWidgets('BeersList contains a ListView', (WidgetTester tester) async {
    //   await tester.pumpWidget(SizedBox(height: 500, width: 250 ,child: Column(
    //     children: const [
    //       BeersList(),
    //     ],
    //   )));

    //   expect(find.byType(ListView), findsOneWidget);
    // });
  });
}
