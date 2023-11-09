import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/future_operation_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/note_bloc.dart';
import 'package:notez/features/note/presentation/widgets/new_note_button.dart';
import 'package:notez/features/note/presentation/widgets/note_object.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({super.key});

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  late Future notes;
  @override
  void initState() {
    super.initState();
    notes = sl<NoteBloc>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AllNotesPageStateCubit, FutureOperationState>(
        builder: (context, allNotesState) {
          return FutureBuilder(
            future: notes,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    ...List.generate(
                      snapshot.data!.length,
                      (index) => NoteObject(
                        note: snapshot.data![index],
                      ),
                    ),
                    const NewNoteButton(),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
