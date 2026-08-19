import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/usecase/usecase.dart';
import 'package:elite_dangerous/features/guides/domain/entities/guide.dart';
import 'package:elite_dangerous/features/guides/domain/repositories/guide_repository.dart';
import 'package:elite_dangerous/features/guides/domain/usecases/get_guide.dart';
import 'package:elite_dangerous/features/guides/domain/usecases/get_guide_read_sections.dart';
import 'package:elite_dangerous/features/guides/domain/usecases/list_guides.dart';
import 'package:elite_dangerous/features/guides/domain/usecases/mark_guide_section_read.dart';
import 'package:elite_dangerous/features/guides/domain/usecases/search_guides.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../guide_fixtures.dart';

class MockGuideRepository extends Mock implements GuideRepository {}

void main() {
  late MockGuideRepository repository;

  const List<GuideSummary> allSummaries = <GuideSummary>[];

  setUp(() {
    repository = MockGuideRepository();
    when(repository.listGuides).thenAnswer(
      (_) async => Success<List<GuideSummary>>(<GuideSummary>[
        explorationGuide.summary,
        beginnerGuide.summary,
      ]),
    );
    when(() => repository.getGuide('exploration-exobiologie'))
        .thenAnswer((_) async => const Success<Guide>(explorationGuide));
    when(() => repository.getGuide('debuter-sans-combat'))
        .thenAnswer((_) async => const Success<Guide>(beginnerGuide));
  });

  group('ListGuides', () {
    test('delegates to the repository', () async {
      final ListGuides useCase = ListGuides(repository);

      final Result<List<GuideSummary>> result =
          await useCase(const NoParams());

      expect(result.valueOrNull, hasLength(2));
      verify(repository.listGuides).called(1);
    });

    test('propagates the failure untouched', () async {
      when(repository.listGuides).thenAnswer(
        (_) async => const ResultFailure<List<GuideSummary>>(
          NotFoundFailure(),
        ),
      );

      final Result<List<GuideSummary>> result =
          await ListGuides(repository)(const NoParams());

      expect(result.failureOrNull, isA<NotFoundFailure>());
    });
  });

  group('GetGuide', () {
    test('delegates to the repository', () async {
      final Result<Guide> result =
          await GetGuide(repository)('exploration-exobiologie');

      expect(result.valueOrNull, explorationGuide);
    });
  });

  group('GetGuideReadSections', () {
    test('delegates to the repository', () async {
      when(() => repository.readSectionIds('exploration-exobiologie'))
          .thenAnswer(
        (_) async => const Success<Set<String>>(<String>{'choisir-son-vaisseau'}),
      );

      final Result<Set<String>> result =
          await GetGuideReadSections(repository)('exploration-exobiologie');

      expect(result.valueOrNull, <String>{'choisir-son-vaisseau'});
    });
  });

  group('MarkGuideSectionRead', () {
    test('forwards both identifiers to the repository', () async {
      when(
        () => repository.markSectionRead(
          'exploration-exobiologie',
          'choisir-son-vaisseau',
        ),
      ).thenAnswer((_) async => const Success<void>(null));

      final Result<void> result = await MarkGuideSectionRead(repository)(
        const GuideSectionRef(
          guideId: 'exploration-exobiologie',
          sectionId: 'choisir-son-vaisseau',
        ),
      );

      expect(result.isSuccess, isTrue);
      verify(
        () => repository.markSectionRead(
          'exploration-exobiologie',
          'choisir-son-vaisseau',
        ),
      ).called(1);
    });

    test('a section reference compares by value', () {
      expect(
        const GuideSectionRef(guideId: 'a', sectionId: 'b'),
        const GuideSectionRef(guideId: 'a', sectionId: 'b'),
      );
      expect(
        const GuideSectionRef(guideId: 'a', sectionId: 'b'),
        isNot(const GuideSectionRef(guideId: 'a', sectionId: 'c')),
      );
    });
  });

  group('SearchGuides', () {
    test('a blank query returns the whole library untouched', () async {
      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('   ');

      expect(
        result.valueOrNull?.map((GuideSummary s) => s.id),
        <String>['exploration-exobiologie', 'debuter-sans-combat'],
      );
      verifyNever(() => repository.getGuide(any()));
    });

    test('filters on the title', () async {
      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('galaxie');

      expect(
        result.valueOrNull?.map((GuideSummary s) => s.id),
        <String>['exploration-exobiologie'],
      );
    });

    test('filters on the topics', () async {
      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('minage');

      expect(
        result.valueOrNull?.map((GuideSummary s) => s.id),
        <String>['debuter-sans-combat'],
      );
    });

    test('filters on the prose of the blocks', () async {
      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('Diamondback');

      expect(
        result.valueOrNull?.map((GuideSummary s) => s.id),
        <String>['exploration-exobiologie'],
      );
    });

    test('ignores case and diacritics', () async {
      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('DEBUTANT');

      expect(
        result.valueOrNull?.map((GuideSummary s) => s.id),
        <String>['debuter-sans-combat'],
      );
    });

    test('returns an empty list when nothing matches', () async {
      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('hyperespace thargoïde');

      expect(result.valueOrNull, allSummaries);
    });

    test('propagates a failure raised while listing', () async {
      when(repository.listGuides).thenAnswer(
        (_) async => const ResultFailure<List<GuideSummary>>(CacheFailure()),
      );

      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('galaxie');

      expect(result.failureOrNull, isA<CacheFailure>());
    });

    test('propagates a failure raised while loading a guide', () async {
      when(() => repository.getGuide('debuter-sans-combat'))
          .thenAnswer((_) async => const ResultFailure<Guide>(ParsingFailure()));

      final Result<List<GuideSummary>> result =
          await SearchGuides(repository)('galaxie');

      expect(result.failureOrNull, isA<ParsingFailure>());
    });
  });
}
