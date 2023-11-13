import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/side_menu/entities/menu.dart';
import 'package:notez/features/side_menu/presentation/presentation_logic_holders/side_menu_state.dart';

class ReadNotePage extends StatefulWidget {
  const ReadNotePage({Key? key, required this.noteId}) : super(key: key);
  final String noteId;
  @override
  State<ReadNotePage> createState() => _ReadNotePageState();
}

class _ReadNotePageState extends State<ReadNotePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // controller.text = context.read<CurrentNoteCubit>().state!.content ?? '';
    context.read<SideMenuStateCubit>().setMenu(Menu.note);

    return const Scaffold(
      backgroundColor: Colors.transparent,
      // body: TextFormField(
      //   controller: controller,
      //   maxLines: 10000,
      //   autofocus: true,
      //   decoration: const InputDecoration(
      //     border: InputBorder.none,
      //     focusedBorder: InputBorder.none,
      //     enabledBorder: InputBorder.none,
      //   ),
      //   onChanged: (value) async {
      //     context.read<CurrentNoteCubit>().updateContent(value);
      //     await context.read<CurrentNoteCubit>().updateNote();
      //   },
      // ),
    );
  }
}
