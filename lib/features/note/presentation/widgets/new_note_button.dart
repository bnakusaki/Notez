import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/note/presentation/bloc/note_bloc.dart';
import 'package:notez/features/note/presentation/bloc/note_events.dart';
import 'package:notez/features/note/presentation/bloc/note_state.dart';

class NewNoteButton extends StatefulWidget {
  const NewNoteButton({super.key});

  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
}

class _NewNoteButtonState extends State<NewNoteButton> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        switch (state) {
          case NoteOperationOngoing():
            return const CircularProgressIndicator();
          default:
            return InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () => context.read<NoteBloc>().add(CerateNoteEvent()),
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: Icon(
                  Ionicons.add,
                  size: 60,
                ),
              ),
            );
        }
      },
    );
  }
}
