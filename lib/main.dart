import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_brew/ui/widgets/beers_widgets.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Brew',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: Typography.dense2021,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Choose your beer',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(
                height: (screenSize.height / 4) * 3.2,
                child: const BeersList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
