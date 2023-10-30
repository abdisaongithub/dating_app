// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LanguageModel {
  String get localeCode => throw _privateConstructorUsedError;
  String get languageLabel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageModelCopyWith<LanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageModelCopyWith<$Res> {
  factory $LanguageModelCopyWith(
          LanguageModel value, $Res Function(LanguageModel) then) =
      _$LanguageModelCopyWithImpl<$Res, LanguageModel>;
  @useResult
  $Res call({String localeCode, String languageLabel});
}

/// @nodoc
class _$LanguageModelCopyWithImpl<$Res, $Val extends LanguageModel>
    implements $LanguageModelCopyWith<$Res> {
  _$LanguageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeCode = null,
    Object? languageLabel = null,
  }) {
    return _then(_value.copyWith(
      localeCode: null == localeCode
          ? _value.localeCode
          : localeCode // ignore: cast_nullable_to_non_nullable
              as String,
      languageLabel: null == languageLabel
          ? _value.languageLabel
          : languageLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageModelImplCopyWith<$Res>
    implements $LanguageModelCopyWith<$Res> {
  factory _$$LanguageModelImplCopyWith(
          _$LanguageModelImpl value, $Res Function(_$LanguageModelImpl) then) =
      __$$LanguageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localeCode, String languageLabel});
}

/// @nodoc
class __$$LanguageModelImplCopyWithImpl<$Res>
    extends _$LanguageModelCopyWithImpl<$Res, _$LanguageModelImpl>
    implements _$$LanguageModelImplCopyWith<$Res> {
  __$$LanguageModelImplCopyWithImpl(
      _$LanguageModelImpl _value, $Res Function(_$LanguageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeCode = null,
    Object? languageLabel = null,
  }) {
    return _then(_$LanguageModelImpl(
      localeCode: null == localeCode
          ? _value.localeCode
          : localeCode // ignore: cast_nullable_to_non_nullable
              as String,
      languageLabel: null == languageLabel
          ? _value.languageLabel
          : languageLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LanguageModelImpl implements _LanguageModel {
  const _$LanguageModelImpl(
      {required this.localeCode, required this.languageLabel});

  @override
  final String localeCode;
  @override
  final String languageLabel;

  @override
  String toString() {
    return 'LanguageModel(localeCode: $localeCode, languageLabel: $languageLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageModelImpl &&
            (identical(other.localeCode, localeCode) ||
                other.localeCode == localeCode) &&
            (identical(other.languageLabel, languageLabel) ||
                other.languageLabel == languageLabel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localeCode, languageLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageModelImplCopyWith<_$LanguageModelImpl> get copyWith =>
      __$$LanguageModelImplCopyWithImpl<_$LanguageModelImpl>(this, _$identity);
}

abstract class _LanguageModel implements LanguageModel {
  const factory _LanguageModel(
      {required final String localeCode,
      required final String languageLabel}) = _$LanguageModelImpl;

  @override
  String get localeCode;
  @override
  String get languageLabel;
  @override
  @JsonKey(ignore: true)
  _$$LanguageModelImplCopyWith<_$LanguageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
