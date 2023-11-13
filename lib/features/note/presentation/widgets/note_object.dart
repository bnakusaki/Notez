import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:notez/features/header/presentation/presentation_logic_holders/header_title_state.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';

class NoteObject extends StatelessWidget {
  const NoteObject({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    String content = note.content?.trim() ?? 'No content';
    if (note.content == '') {
      content = 'No content';
    }
    return SizedBox(
      width: 300,
      child: Card(
        child: InkWell(
          onTap: () async {
            context.go('/readNote/${note.id}');
            context.read<HeaderTitleStateCubit>().setHeaderTitle(note.title);
            await context.read<CurrentNoteCubit>().setNote(note.id!);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10.0),
                Text(
                  content,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10.0),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Last modified: ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: DateFormat('EEE, MMM d, y -  h:m a').format(note.lastUpdated),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
