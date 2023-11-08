import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/future_operation_state.dart';
import 'package:notez/shared/widgets/icon_button_with_label.dart';

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
      switch (noteCreationState) {
        case Loading():
          return const CircularProgressIndicator(color: Colors.white);
        default:
          return IconButtonWithLabel(
            onTap: () async => await context.read<AllNotesPageStateCubit>().createNote(),
            icon: Ionicons.add,
            label: 'New note',
          );
      }
    });
  }
}
