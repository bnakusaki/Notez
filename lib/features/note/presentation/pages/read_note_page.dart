import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';

class ReadNotePage extends StatefulWidget {
  const ReadNotePage({super.key});

  @override
  State<ReadNotePage> createState() => _ReadNotePageState();
}

class _ReadNotePageState extends State<ReadNotePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = context.read<CurrentNoteCubit>().state!.content ?? '';

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TextFormField(
        controller: controller,
        maxLines: 10000,
        autofocus: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        onChanged: (value) async {
          context.read<CurrentNoteCubit>().updateContent(value);
          await context.read<CurrentNoteCubit>().updateNote();
        },
      ),
    );
  }
}
