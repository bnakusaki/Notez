/// An enum of Notez's Feature Type.
enum Kind { note, todo, folder }

/// Parses formatted [String] to [Kind].
Kind toKind(String arg) {
  switch (arg) {
    case 'note':
      return Kind.note;
    case 'todo':
      return Kind.todo;
    default:
      return Kind.folder;
  }
}
