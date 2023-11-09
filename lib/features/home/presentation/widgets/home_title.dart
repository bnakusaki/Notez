import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentNoteCubit, Note?>(
      builder: (context, state) {
        return Text(
          state == null ? 'Notes' : state.title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        );
      },
    );
  }
}
