import 'package:flutter/material.dart';
import 'package:real_brew/services/beer_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Brew',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Choose your beer',
          ),
          BeersList(),
        ],
      ),
    );
  }
}

class BeersList extends StatelessWidget {
  const BeersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BeerAPI().getBeers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text("Beer number ${index + 1}");
              },
            );
          }
          return Container();
        });
  }
}
