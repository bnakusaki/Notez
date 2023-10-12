import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notez/features/note/domain/entities/note.dart';

/// Holds the state of the current note the app is reading.
final noteStateProvider = StateProvider<Note?>((ref) => null);
