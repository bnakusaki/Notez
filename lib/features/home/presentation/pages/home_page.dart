import 'package:flutter/material.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeState homeState = HomeState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notez'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
