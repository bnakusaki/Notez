import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_event.dart';
import 'package:notez/features/note/presentation/bloc/note_bloc.dart';
import 'package:notez/features/note/presentation/bloc/note_events.dart';
import 'package:notez/features/note/presentation/bloc/note_state.dart';
import 'package:notez/features/note/presentation/widgets/new_note_button.dart';
import 'package:notez/features/note/presentation/widgets/note_object.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_bloc.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_events.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({super.key});

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  @override
  void initState() {
    super.initState();
    context.read<HeaderBloc>().add(SetHeaderTitle('Notes'));
    context.read<SideMenuBloc>().add(HomeMenuEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
          switch (state) {
            case NoNote():
              context.read<NoteBloc>().add(GetAllNotesEvent());
              return const SizedBox.shrink();
            case NoteOperationOngoing():
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              );
            case AllNotesState():
              return Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  ...List.generate(
                    state.notes.length,
                    (index) => NoteObject(
                      note: state.notes[index],
                    ),
                  ),
                  const NewNoteButton()
                ],
              );
            default:
              context.read<NoteBloc>().add(GetAllNotesEvent());
              return const Center(
                child: Text('Failed to load notes'),
              );
          }
        }));
  }
}
