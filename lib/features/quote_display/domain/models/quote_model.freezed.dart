// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuoteModel {
  String get content => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteModelCopyWith<QuoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteModelCopyWith<$Res> {
  factory $QuoteModelCopyWith(
          QuoteModel value, $Res Function(QuoteModel) then) =
      _$QuoteModelCopyWithImpl<$Res, QuoteModel>;
  @useResult
  $Res call({String content, String author});
}

/// @nodoc
class _$QuoteModelCopyWithImpl<$Res, $Val extends QuoteModel>
    implements $QuoteModelCopyWith<$Res> {
  _$QuoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteModelImplCopyWith<$Res>
    implements $QuoteModelCopyWith<$Res> {
  factory _$$QuoteModelImplCopyWith(
          _$QuoteModelImpl value, $Res Function(_$QuoteModelImpl) then) =
      __$$QuoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String author});
}

/// @nodoc
class __$$QuoteModelImplCopyWithImpl<$Res>
    extends _$QuoteModelCopyWithImpl<$Res, _$QuoteModelImpl>
    implements _$$QuoteModelImplCopyWith<$Res> {
  __$$QuoteModelImplCopyWithImpl(
      _$QuoteModelImpl _value, $Res Function(_$QuoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? author = null,
  }) {
    return _then(_$QuoteModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuoteModelImpl with DiagnosticableTreeMixin implements _QuoteModel {
  const _$QuoteModelImpl({required this.content, required this.author});

  @override
  final String content;
  @override
  final String author;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuoteModel(content: $content, author: $author)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuoteModel'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('author', author));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteModelImplCopyWith<_$QuoteModelImpl> get copyWith =>
      __$$QuoteModelImplCopyWithImpl<_$QuoteModelImpl>(this, _$identity);
}

abstract class _QuoteModel implements QuoteModel {
  const factory _QuoteModel(
      {required final String content,
      required final String author}) = _$QuoteModelImpl;

  @override
  String get content;
  @override
  String get author;
  @override
  @JsonKey(ignore: true)
  _$$QuoteModelImplCopyWith<_$QuoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
