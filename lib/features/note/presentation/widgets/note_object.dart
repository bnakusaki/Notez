import 'package:flutter/material.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/format_date_time.dart';

class NoteObject extends StatelessWidget {
  const NoteObject(
    this.title,
    this.createdOn, {
    super.key,
  });

  final String title;
  final DateTime createdOn;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(title),
      subtitle: Text(formatDateTime(createdOn)),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }
}
