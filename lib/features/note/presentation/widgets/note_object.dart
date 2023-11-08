import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';
import 'package:notez/shared/widgets/icon_button_with_label.dart';

class NoteObject extends StatelessWidget {
  const NoteObject({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return IconButtonWithLabel(
      onTap: () {
        context.read<CurrentNoteCubit>().setNote(note);
        context.go('/readNote');
      },
      icon: Ionicons.document_outline,
      label: note.title,
    );
  }
}
