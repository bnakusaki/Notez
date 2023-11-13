import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/header/presentation/presentation_logic_holders/header_title_state.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/future_operation_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/note_bloc.dart';
import 'package:notez/features/note/presentation/widgets/new_note_button.dart';
import 'package:notez/features/note/presentation/widgets/note_object.dart';
import 'package:notez/features/side_menu/entities/menu.dart';
import 'package:notez/features/side_menu/presentation/presentation_logic_holders/side_menu_state.dart';

class AllNotesPage extends StatelessWidget {
  const AllNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HeaderTitleStateCubit>().setHeaderTitle('Notes');
    context.read<SideMenuStateCubit>().setMenu(Menu.home);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AllNotesPageStateCubit, FutureOperationState>(
        builder: (context, allNotesState) {
          return FutureBuilder(
            future: sl<NoteBloc>().getNotes(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
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
