import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/future_operation_state.dart';

class NewNoteButton extends StatefulWidget {
  const NewNoteButton({super.key});

  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
}

class _NewNoteButtonState extends State<NewNoteButton> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesPageStateCubit, FutureOperationState>(
        builder: (context, noteCreationState) {
      debugPrint(noteCreationState.toString());
      return InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: noteCreationState == Loading()
            ? null
            : () async => await context.read<AllNotesPageStateCubit>().createNote(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: noteCreationState == Loading()
              ? const CircularProgressIndicator()
              : const Icon(
                  Ionicons.add,
                  size: 60,
                ),
        ),
      );
    });
  }
}
