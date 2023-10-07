enum Kind { note, todo, folder }

Kind toKind(String arg) {
  if (arg == 'note') return Kind.note;
  if (arg == 'todo') return Kind.todo;
  return Kind.folder;
}
