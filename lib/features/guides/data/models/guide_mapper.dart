import 'dart:convert';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/guide.dart';
import 'guide_dto.dart';

/// Turns the authored JSON of `assets/guides/` into domain entities.
///
/// Two different failure policies coexist here on purpose:
///
/// * A **structural** problem — invalid JSON, a missing id, an unknown block
///   type — is a bug in the shipped content and must be loud, so it surfaces as
///   a [ParsingFailure] in review rather than as a silently truncated guide.
/// * An **unknown enum value** degrades to a neutral default. A callout whose
///   tone was misspelt should still be readable in the field; refusing to open
///   the whole guide over a colour would be the worse outcome.
abstract final class GuideMapper {
  static Result<Guide> parseGuide(String raw) => guardSync(
        () {
          final Object? decoded = jsonDecode(raw);
          if (decoded is! Map<String, dynamic>) {
            throw const FormatException(
              'Le guide doit être un objet JSON.',
            );
          }
          return GuideDto.fromJson(decoded).toEntity();
        },
        onError: (Object error, _) => ParsingFailure(
          message: 'Guide illisible : ${_describe(error)}',
          cause: error,
        ),
      );

  static Result<List<String>> parseIndex(String raw) => guardSync(
        () {
          final Object? decoded = jsonDecode(raw);
          if (decoded is! Map<String, dynamic>) {
            throw const FormatException(
              'L\'index des guides doit être un objet JSON.',
            );
          }
          final Object? guides = decoded['guides'];
          if (guides is! List<dynamic>) {
            throw const FormatException(
              'L\'index des guides doit contenir une liste « guides ».',
            );
          }
          return guides.whereType<String>().toList(growable: false);
        },
        onError: (Object error, _) => ParsingFailure(
          message: 'Index des guides illisible : ${_describe(error)}',
          cause: error,
        ),
      );

  static String _describe(Object error) => switch (error) {
        final FormatException e => e.message,
        _ => error.toString(),
      };
}
