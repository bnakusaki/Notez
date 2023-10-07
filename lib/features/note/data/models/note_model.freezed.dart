// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime get createdOn => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  Kind get kind => throw _privateConstructorUsedError;
  List<int>? get todos => throw _privateConstructorUsedError;
  int? get folder => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res, NoteModel>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String? content,
      DateTime createdOn,
      DateTime lastUpdated,
      Kind kind,
      List<int>? todos,
      int? folder,
      Location location});
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res, $Val extends NoteModel>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = freezed,
    Object? createdOn = null,
    Object? lastUpdated = null,
    Object? kind = null,
    Object? todos = freezed,
    Object? folder = freezed,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as Kind,
      todos: freezed == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as int?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteModelImplCopyWith<$Res>
    implements $NoteModelCopyWith<$Res> {
  factory _$$NoteModelImplCopyWith(
          _$NoteModelImpl value, $Res Function(_$NoteModelImpl) then) =
      __$$NoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String? content,
      DateTime createdOn,
      DateTime lastUpdated,
      Kind kind,
      List<int>? todos,
      int? folder,
      Location location});
}

/// @nodoc
class __$$NoteModelImplCopyWithImpl<$Res>
    extends _$NoteModelCopyWithImpl<$Res, _$NoteModelImpl>
    implements _$$NoteModelImplCopyWith<$Res> {
  __$$NoteModelImplCopyWithImpl(
      _$NoteModelImpl _value, $Res Function(_$NoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = freezed,
    Object? createdOn = null,
    Object? lastUpdated = null,
    Object? kind = null,
    Object? todos = freezed,
    Object? folder = freezed,
    Object? location = null,
  }) {
    return _then(_$NoteModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as Kind,
      todos: freezed == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as int?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc

class _$NoteModelImpl extends _NoteModel {
  _$NoteModelImpl(
      {this.id,
      required this.title,
      this.content,
      required this.createdOn,
      required this.lastUpdated,
      required this.kind,
      final List<int>? todos,
      this.folder,
      required this.location})
      : _todos = todos,
        super._();

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? content;
  @override
  final DateTime createdOn;
  @override
  final DateTime lastUpdated;
  @override
  final Kind kind;
  final List<int>? _todos;
  @override
  List<int>? get todos {
    final value = _todos;
    if (value == null) return null;
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? folder;
  @override
  final Location location;

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, content: $content, createdOn: $createdOn, lastUpdated: $lastUpdated, kind: $kind, todos: $todos, folder: $folder, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      createdOn,
      lastUpdated,
      kind,
      const DeepCollectionEquality().hash(_todos),
      folder,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      __$$NoteModelImplCopyWithImpl<_$NoteModelImpl>(this, _$identity);
}

abstract class _NoteModel extends NoteModel {
  factory _NoteModel(
      {final int? id,
      required final String title,
      final String? content,
      required final DateTime createdOn,
      required final DateTime lastUpdated,
      required final Kind kind,
      final List<int>? todos,
      final int? folder,
      required final Location location}) = _$NoteModelImpl;
  _NoteModel._() : super._();

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get content;
  @override
  DateTime get createdOn;
  @override
  DateTime get lastUpdated;
  @override
  Kind get kind;
  @override
  List<int>? get todos;
  @override
  int? get folder;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
