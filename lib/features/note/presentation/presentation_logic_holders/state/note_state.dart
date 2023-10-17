import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_state.freezed.dart';

@freezed
abstract class NoteState with _$NoteState {
  const factory NoteState.initial() = Initial;
  const factory NoteState.loading() = Loading;
  const factory NoteState.failure() = Failure;
  const factory NoteState.success() = Success;
}
