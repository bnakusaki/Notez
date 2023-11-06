import 'package:notez/features/authentication/authentication_dependency_injection.dart'
    as authentication_dependency_injection;
import 'package:notez/features/note/note_dependency_injection.dart' as note_dependency_injection;

void init() {
  authentication_dependency_injection.init();
  note_dependency_injection.init();
}
