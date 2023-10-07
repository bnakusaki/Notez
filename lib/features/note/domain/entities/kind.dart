/// An enum of Notez's Feature Type.
enum Kind { note, todo, folder }

/// Returns String parsed to [Kind].
Kind toKind(String arg) {
  if (arg == 'note') return Kind.note;
  if (arg == 'todo') return Kind.todo;
  return Kind.folder;
}
