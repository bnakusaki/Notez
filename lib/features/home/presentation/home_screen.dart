import 'package:flutter/material.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeState homeState = HomeState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notez'),
        ),
        body: FutureBuilder(
          future: homeState.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              final response = snapshot.data;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return null;
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data!.length());
            }
            return const Center(
              child: Text('Oops, something is wrong'),
            );
          },
        ));
  }
}
