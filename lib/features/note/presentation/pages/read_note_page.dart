import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_event.dart';
import 'package:notez/features/note/presentation/bloc/note_bloc.dart';
import 'package:notez/features/note/presentation/bloc/note_events.dart';
import 'package:notez/features/note/presentation/bloc/note_state.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_bloc.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_events.dart';

class ReadNotePage extends StatefulWidget {
  const ReadNotePage({Key? key, required this.noteId}) : super(key: key);
  final String noteId;
  @override
  State<ReadNotePage> createState() => _ReadNotePageState();
}

class _ReadNotePageState extends State<ReadNotePage> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(ReadNoteEvent(widget.noteId));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          switch (state) {
            case NoteOperationOngoing():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case NoteInFocus():
              context.read<SideMenuBloc>().add(NoteMenuEvent());
              context.read<HeaderBloc>().add(SetHeaderTitle(state.note.title));
              controller.text = state.note.content ?? '';
              return TextFormField(
                controller: controller,
                maxLines: 10000,
                autofocus: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  context.read<NoteBloc>().add(
                        UpdateNoteEvent(
                          state.note.copyWith(content: value),
                        ),
                      );
                },
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
