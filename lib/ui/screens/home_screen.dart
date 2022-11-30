import 'package:flutter/material.dart';
import 'package:real_brew/ui/widgets/widgets.dart';
import 'package:real_brew/util/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeScreenContents();
  }
}

class _HomeScreenContents extends StatelessWidget {
  const _HomeScreenContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Choose your beer',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          const Expanded(
            child: BeersList(),
          ),
        ],
      ),
    );
  }
}
