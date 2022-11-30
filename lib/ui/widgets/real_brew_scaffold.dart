import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/bottom_bar.dart';

class RealBrewScaffold extends StatelessWidget {
  const RealBrewScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: const RealBrewBottomBar(),
    );
  }
}
