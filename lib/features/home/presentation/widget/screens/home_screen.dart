import 'package:flutter/material.dart';
import 'package:notez/features/home/home_dependency_injection.dart';
import 'package:notez/features/home/presentation/presentation_logic_holders/home_bloc.dart';
import 'package:notez/features/note/presentation/widgets/note_object.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: false,
      ),
      body: FutureBuilder(
          future: bloc.getNotes(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return NoteObject(data[index].title, data[index].createdOn);
                    })
                : const CircularProgressIndicator();
          }),
    );
  }
}
