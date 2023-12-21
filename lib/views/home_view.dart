import 'package:aaaaa/icecream/icecream_view.dart';
import 'package:aaaaa/views/Calculator/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: IcecreamView(),
            ),
      );
  }
}
