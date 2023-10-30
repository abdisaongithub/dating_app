import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';

@freezed
class LanguageModel with _$LanguageModel {
  const factory LanguageModel({
    required String localeCode,
    required String languageLabel,
  }) = _LanguageModel;
}
