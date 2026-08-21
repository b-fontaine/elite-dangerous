// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/datasources/frontier_auth_api.dart' as _i269;
import '../../features/auth/data/datasources/redirect_listener_factory.dart'
    as _i776;
import '../../features/auth/data/frontier_access_token_provider.dart' as _i572;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/data/services/browser_launcher.dart' as _i1037;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/auth_usecases.dart' as _i46;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/commander/data/datasources/commander_api.dart' as _i261;
import '../../features/commander/data/datasources/commander_local_data_source.dart'
    as _i806;
import '../../features/commander/data/repositories/commander_repository_impl.dart'
    as _i538;
import '../../features/commander/domain/repositories/commander_repository.dart'
    as _i851;
import '../../features/commander/domain/usecases/commander_usecases.dart'
    as _i694;
import '../../features/commander/presentation/bloc/commander_bloc.dart'
    as _i820;
import '../../features/diagnostics/data/datasources/diagnostics_api.dart'
    as _i395;
import '../../features/diagnostics/data/diagnostics_module.dart' as _i944;
import '../../features/diagnostics/data/repositories/diagnostics_repository_impl.dart'
    as _i901;
import '../../features/diagnostics/data/services/payload_exporter.dart'
    as _i721;
import '../../features/diagnostics/domain/repositories/diagnostics_repository.dart'
    as _i13;
import '../../features/diagnostics/domain/services/payload_inspector.dart'
    as _i653;
import '../../features/diagnostics/domain/usecases/diagnostics_usecases.dart'
    as _i1044;
import '../../features/diagnostics/presentation/bloc/diagnostics_bloc.dart'
    as _i516;
import '../../features/exobiology/data/datasources/exobiology_catalog_asset_data_source.dart'
    as _i906;
import '../../features/exobiology/data/datasources/exobiology_progress_local_data_source.dart'
    as _i55;
import '../../features/exobiology/data/exobiology_module.dart' as _i152;
import '../../features/exobiology/data/repositories/commander_snapshot_adapter.dart'
    as _i128;
import '../../features/exobiology/data/repositories/exobiology_catalog_repository_impl.dart'
    as _i412;
import '../../features/exobiology/data/repositories/exobiology_progress_repository_impl.dart'
    as _i1027;
import '../../features/exobiology/domain/repositories/commander_snapshot_source.dart'
    as _i643;
import '../../features/exobiology/domain/repositories/exobiology_catalog_repository.dart'
    as _i686;
import '../../features/exobiology/domain/repositories/exobiology_progress_repository.dart'
    as _i554;
import '../../features/exobiology/domain/services/exobiology_roadmap_engine.dart'
    as _i437;
import '../../features/exobiology/domain/services/roadmap_declaration_resolver.dart'
    as _i144;
import '../../features/exobiology/domain/services/species_matcher.dart' as _i5;
import '../../features/exobiology/domain/usecases/exobiology_usecases.dart'
    as _i396;
import '../../features/exobiology/presentation/bloc/field_report_bloc.dart'
    as _i47;
import '../../features/exobiology/presentation/bloc/roadmap_bloc.dart' as _i6;
import '../../features/exobiology/presentation/bloc/species_catalog_bloc.dart'
    as _i808;
import '../../features/exobiology/presentation/bloc/species_finder_bloc.dart'
    as _i692;
import '../../features/guides/data/datasources/guide_asset_data_source.dart'
    as _i258;
import '../../features/guides/data/datasources/guide_read_state_local_data_source.dart'
    as _i585;
import '../../features/guides/data/repositories/guide_repository_impl.dart'
    as _i618;
import '../../features/guides/domain/repositories/guide_repository.dart'
    as _i514;
import '../../features/guides/domain/usecases/get_guide.dart' as _i1013;
import '../../features/guides/domain/usecases/get_guide_read_sections.dart'
    as _i531;
import '../../features/guides/domain/usecases/list_guides.dart' as _i7;
import '../../features/guides/domain/usecases/mark_guide_section_read.dart'
    as _i468;
import '../../features/guides/domain/usecases/search_guides.dart' as _i215;
import '../../features/guides/presentation/bloc/guide_detail_bloc.dart'
    as _i709;
import '../../features/guides/presentation/bloc/guides_bloc.dart' as _i137;
import '../../features/journal/data/datasources/game_state_data_source.dart'
    as _i351;
import '../../features/journal/data/datasources/journal_api.dart' as _i80;
import '../../features/journal/data/datasources/journal_file_data_source.dart'
    as _i62;
import '../../features/journal/data/datasources/journal_local_store.dart'
    as _i896;
import '../../features/journal/data/datasources/journal_tail_data_source.dart'
    as _i38;
import '../../features/journal/data/journal_module.dart' as _i245;
import '../../features/journal/data/repositories/journal_repository_impl.dart'
    as _i547;
import '../../features/journal/data/repositories/live_journal_repository_impl.dart'
    as _i561;
import '../../features/journal/domain/repositories/journal_repository.dart'
    as _i636;
import '../../features/journal/domain/repositories/live_journal_repository.dart'
    as _i611;
import '../../features/journal/domain/services/exobiology_activity_aggregator.dart'
    as _i888;
import '../../features/journal/domain/services/journal_event_parser.dart'
    as _i644;
import '../../features/journal/domain/services/journal_session_aggregator.dart'
    as _i1060;
import '../../features/journal/domain/services/system_survey_builder.dart'
    as _i661;
import '../../features/journal/domain/usecases/journal_usecases.dart' as _i832;
import '../../features/journal/presentation/bloc/journal_bloc.dart' as _i366;
import '../../features/materials/data/datasources/material_catalog_asset_data_source.dart'
    as _i331;
import '../../features/materials/data/materials_module.dart' as _i48;
import '../../features/materials/data/repositories/material_catalog_repository_impl.dart'
    as _i442;
import '../../features/materials/domain/repositories/material_catalog_repository.dart'
    as _i1035;
import '../../features/materials/domain/services/material_planner.dart'
    as _i1008;
import '../../features/materials/domain/usecases/material_usecases.dart'
    as _i91;
import '../../features/materials/presentation/bloc/materials_bloc.dart'
    as _i1052;
import '../../features/settings/data/settings_repository_impl.dart' as _i659;
import '../../features/settings/domain/repositories/settings_repository.dart'
    as _i674;
import '../../features/settings/domain/usecases/settings_usecases.dart'
    as _i279;
import '../../features/settings/presentation/bloc/settings_bloc.dart' as _i586;
import '../../features/system_lookup/data/datasources/spansh_api.dart'
    as _i1024;
import '../../features/system_lookup/data/datasources/system_lookup_cache.dart'
    as _i256;
import '../../features/system_lookup/data/repositories/system_lookup_repository_impl.dart'
    as _i168;
import '../../features/system_lookup/domain/repositories/system_lookup_repository.dart'
    as _i925;
import '../../features/system_lookup/domain/usecases/system_lookup_usecases.dart'
    as _i490;
import '../../features/system_lookup/presentation/bloc/system_chart_bloc.dart'
    as _i731;
import '../config/build_config.dart' as _i237;
import '../network/access_token_provider.dart' as _i962;
import '../network/network_module.dart' as _i200;
import '../storage/flutter_secure_store.dart' as _i889;
import '../storage/key_value_store.dart' as _i892;
import '../storage/line_store.dart' as _i937;
import '../storage/secure_store.dart' as _i271;
import '../storage/shared_preferences_key_value_store.dart' as _i782;
import '../storage/storage_module.dart' as _i699;
import '../time/clock.dart' as _i807;
import 'core_module.dart' as _i154;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    final diagnosticsModule = _$DiagnosticsModule();
    final exobiologyModule = _$ExobiologyModule();
    final journalModule = _$JournalModule();
    final materialsModule = _$MaterialsModule();
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i237.BuildConfig>(() => const _i237.BuildConfig());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreModule.secureStorage,
    );
    gh.lazySingleton<_i776.RedirectListenerFactory>(
      () => const _i776.RedirectListenerFactory(),
    );
    gh.lazySingleton<_i653.PayloadInspector>(
      () => diagnosticsModule.payloadInspector,
    );
    gh.lazySingleton<_i721.PayloadExporter>(
      () => const _i721.PayloadExporter(),
    );
    gh.lazySingleton<_i906.ExobiologyCatalogAssetDataSource>(
      () => const _i906.ExobiologyCatalogAssetDataSource(),
    );
    gh.lazySingleton<_i5.SpeciesMatcher>(() => exobiologyModule.speciesMatcher);
    gh.lazySingleton<_i144.RoadmapDeclarationResolver>(
      () => exobiologyModule.declarationResolver,
    );
    gh.lazySingleton<_i258.GuideAssetDataSource>(
      () => const _i258.GuideAssetDataSource(),
    );
    gh.lazySingleton<_i351.GameStateDataSource>(
      () => const _i351.GameStateDataSource(),
    );
    gh.lazySingleton<_i62.JournalFileDataSource>(
      () => const _i62.JournalFileDataSource(),
    );
    gh.lazySingleton<_i644.JournalEventParser>(() => journalModule.parser);
    gh.lazySingleton<_i888.ExobiologyActivityAggregator>(
      () => journalModule.aggregator,
    );
    gh.lazySingleton<_i1060.JournalSessionAggregator>(
      () => journalModule.sessionAggregator,
    );
    gh.lazySingleton<_i661.SystemSurveyBuilder>(
      () => journalModule.systemSurveyBuilder,
    );
    gh.lazySingleton<_i331.MaterialCatalogAssetDataSource>(
      () => const _i331.MaterialCatalogAssetDataSource(),
    );
    gh.lazySingleton<_i1008.MaterialPlanner>(
      () => materialsModule.materialPlanner,
    );
    gh.lazySingleton<_i686.ExobiologyCatalogRepository>(
      () => _i412.ExobiologyCatalogRepositoryImpl(
        gh<_i906.ExobiologyCatalogAssetDataSource>(),
      ),
    );
    gh.factory<_i396.GetExobiologyCatalog>(
      () => _i396.GetExobiologyCatalog(gh<_i686.ExobiologyCatalogRepository>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.frontierAuthDio(),
      instanceName: 'frontierAuth',
    );
    gh.lazySingleton<_i1037.BrowserLauncher>(
      () => const _i1037.UrlLauncherBrowserLauncher(),
    );
    gh.lazySingleton<_i807.Clock>(() => const _i807.SystemClock());
    gh.lazySingleton<_i271.SecureStore>(
      () => _i889.FlutterSecureStore(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i437.ExobiologyRoadmapEngine>(
      () => exobiologyModule.roadmapEngine(
        gh<_i144.RoadmapDeclarationResolver>(),
      ),
    );
    gh.lazySingleton<_i1035.MaterialCatalogRepository>(
      () => _i442.MaterialCatalogRepositoryImpl(
        gh<_i331.MaterialCatalogAssetDataSource>(),
      ),
    );
    gh.lazySingleton<_i892.KeyValueStore>(
      () => _i782.SharedPreferencesKeyValueStore(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i38.JournalTailDataSource>(
      () => _i38.JournalTailDataSource(gh<_i62.JournalFileDataSource>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.spanshDio(gh<_i807.Clock>()),
      instanceName: 'spansh',
    );
    gh.factory<_i269.FrontierAuthApi>(
      () => _i269.FrontierAuthApi(gh<_i361.Dio>(instanceName: 'frontierAuth')),
    );
    gh.lazySingleton<_i674.SettingsRepository>(
      () => _i659.SettingsRepositoryImpl(gh<_i892.KeyValueStore>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSource(
        gh<_i271.SecureStore>(),
        gh<_i892.KeyValueStore>(),
        gh<_i237.BuildConfig>(),
      ),
    );
    gh.factory<_i808.SpeciesCatalogBloc>(
      () => _i808.SpeciesCatalogBloc(gh<_i396.GetExobiologyCatalog>()),
    );
    gh.lazySingleton<_i937.LineStore>(
      () => storageModule.lineStore(gh<_i892.KeyValueStore>()),
    );
    gh.factory<_i1024.SpanshApi>(
      () => _i1024.SpanshApi(gh<_i361.Dio>(instanceName: 'spansh')),
    );
    gh.factory<_i91.GetMaterialPlans>(
      () => _i91.GetMaterialPlans(
        gh<_i1035.MaterialCatalogRepository>(),
        gh<_i1008.MaterialPlanner>(),
      ),
    );
    gh.factory<_i1052.MaterialsBloc>(
      () => _i1052.MaterialsBloc(gh<_i91.GetMaterialPlans>()),
    );
    gh.lazySingleton<_i806.CommanderLocalDataSource>(
      () => _i806.CommanderLocalDataSource(gh<_i892.KeyValueStore>()),
    );
    gh.lazySingleton<_i55.ExobiologyProgressLocalDataSource>(
      () => _i55.ExobiologyProgressLocalDataSource(gh<_i892.KeyValueStore>()),
    );
    gh.lazySingleton<_i585.GuideReadStateLocalDataSource>(
      () => _i585.GuideReadStateLocalDataSource(gh<_i892.KeyValueStore>()),
    );
    gh.lazySingleton<_i256.SystemLookupCache>(
      () => _i256.SystemLookupCache(gh<_i892.KeyValueStore>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i269.FrontierAuthApi>(),
        gh<_i852.AuthLocalDataSource>(),
        gh<_i776.RedirectListenerFactory>(),
        gh<_i1037.BrowserLauncher>(),
        gh<_i807.Clock>(),
        gh<_i237.BuildConfig>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i279.WatchSettings>(
      () => _i279.WatchSettings(gh<_i674.SettingsRepository>()),
    );
    gh.factory<_i279.SaveSettings>(
      () => _i279.SaveSettings(gh<_i674.SettingsRepository>()),
    );
    gh.factory<_i279.ResetLocalData>(
      () => _i279.ResetLocalData(gh<_i674.SettingsRepository>()),
    );
    gh.lazySingleton<_i896.JournalLocalStore>(
      () => _i896.JournalLocalStore(
        gh<_i892.KeyValueStore>(),
        gh<_i937.LineStore>(),
      ),
    );
    gh.factory<_i586.SettingsBloc>(
      () => _i586.SettingsBloc(
        gh<_i279.WatchSettings>(),
        gh<_i279.SaveSettings>(),
        gh<_i279.ResetLocalData>(),
      ),
    );
    gh.lazySingleton<_i554.ExobiologyProgressRepository>(
      () => _i1027.ExobiologyProgressRepositoryImpl(
        gh<_i55.ExobiologyProgressLocalDataSource>(),
        gh<_i807.Clock>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i925.SystemLookupRepository>(
      () => _i168.SystemLookupRepositoryImpl(
        gh<_i1024.SpanshApi>(),
        gh<_i256.SystemLookupCache>(),
        gh<_i807.Clock>(),
      ),
    );
    gh.lazySingleton<_i514.GuideRepository>(
      () => _i618.GuideRepositoryImpl(
        gh<_i258.GuideAssetDataSource>(),
        gh<_i585.GuideReadStateLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i962.AccessTokenProvider>(
      () => _i572.FrontierAccessTokenProvider(
        gh<_i852.AuthLocalDataSource>(),
        gh<_i787.AuthRepository>(),
        gh<_i807.Clock>(),
      ),
    );
    gh.factory<_i490.LookupSystem>(
      () => _i490.LookupSystem(gh<_i925.SystemLookupRepository>()),
    );
    gh.factory<_i490.LookupBodyLandmarks>(
      () => _i490.LookupBodyLandmarks(gh<_i925.SystemLookupRepository>()),
    );
    gh.factory<_i490.ReadCachedSystem>(
      () => _i490.ReadCachedSystem(gh<_i925.SystemLookupRepository>()),
    );
    gh.factory<_i490.CanLookUpSystems>(
      () => _i490.CanLookUpSystems(gh<_i925.SystemLookupRepository>()),
    );
    gh.factory<_i46.WatchAuthStatus>(
      () => _i46.WatchAuthStatus(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i46.SignInToFrontier>(
      () => _i46.SignInToFrontier(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i46.SignOutFromFrontier>(
      () => _i46.SignOutFromFrontier(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i46.GetOAuthClientConfig>(
      () => _i46.GetOAuthClientConfig(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i46.SaveOAuthClientConfig>(
      () => _i46.SaveOAuthClientConfig(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i46.RefreshFrontierSession>(
      () => _i46.RefreshFrontierSession(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i396.IdentifySpeciesForBody>(
      () => _i396.IdentifySpeciesForBody(
        gh<_i686.ExobiologyCatalogRepository>(),
        gh<_i554.ExobiologyProgressRepository>(),
        gh<_i5.SpeciesMatcher>(),
      ),
    );
    gh.factory<_i396.SetRoadmapStepState>(
      () => _i396.SetRoadmapStepState(gh<_i554.ExobiologyProgressRepository>()),
    );
    gh.factory<_i396.WatchExobiologyProgress>(
      () => _i396.WatchExobiologyProgress(
        gh<_i554.ExobiologyProgressRepository>(),
      ),
    );
    gh.factory<_i396.RecordSampleProgress>(
      () =>
          _i396.RecordSampleProgress(gh<_i554.ExobiologyProgressRepository>()),
    );
    gh.factory<_i396.RemoveSampleRecord>(
      () => _i396.RemoveSampleRecord(gh<_i554.ExobiologyProgressRepository>()),
    );
    gh.factory<_i396.SetDeclaredExobiologyProfit>(
      () => _i396.SetDeclaredExobiologyProfit(
        gh<_i554.ExobiologyProgressRepository>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.frontierApiDio(
        gh<_i962.AccessTokenProvider>(),
        gh<_i807.Clock>(),
      ),
      instanceName: 'frontierApi',
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i46.WatchAuthStatus>(),
        gh<_i46.SignInToFrontier>(),
        gh<_i46.SignOutFromFrontier>(),
        gh<_i46.GetOAuthClientConfig>(),
        gh<_i46.SaveOAuthClientConfig>(),
      ),
    );
    gh.factory<_i1013.GetGuide>(
      () => _i1013.GetGuide(gh<_i514.GuideRepository>()),
    );
    gh.factory<_i531.GetGuideReadSections>(
      () => _i531.GetGuideReadSections(gh<_i514.GuideRepository>()),
    );
    gh.factory<_i7.ListGuides>(
      () => _i7.ListGuides(gh<_i514.GuideRepository>()),
    );
    gh.factory<_i468.MarkGuideSectionRead>(
      () => _i468.MarkGuideSectionRead(gh<_i514.GuideRepository>()),
    );
    gh.factory<_i215.SearchGuides>(
      () => _i215.SearchGuides(gh<_i514.GuideRepository>()),
    );
    gh.factory<_i709.GuideDetailBloc>(
      () => _i709.GuideDetailBloc(
        gh<_i1013.GetGuide>(),
        gh<_i531.GetGuideReadSections>(),
        gh<_i468.MarkGuideSectionRead>(),
      ),
    );
    gh.factory<_i731.SystemChartBloc>(
      () => _i731.SystemChartBloc(
        gh<_i490.LookupSystem>(),
        gh<_i490.LookupBodyLandmarks>(),
        gh<_i490.ReadCachedSystem>(),
        gh<_i490.CanLookUpSystems>(),
      ),
    );
    gh.factory<_i261.CommanderApi>(
      () => _i261.CommanderApi(gh<_i361.Dio>(instanceName: 'frontierApi')),
    );
    gh.factory<_i395.DiagnosticsApi>(
      () => _i395.DiagnosticsApi(gh<_i361.Dio>(instanceName: 'frontierApi')),
    );
    gh.factory<_i80.JournalApi>(
      () => _i80.JournalApi(gh<_i361.Dio>(instanceName: 'frontierApi')),
    );
    gh.factory<_i692.SpeciesFinderBloc>(
      () => _i692.SpeciesFinderBloc(
        gh<_i396.IdentifySpeciesForBody>(),
        gh<_i396.GetExobiologyCatalog>(),
        gh<_i5.SpeciesMatcher>(),
      ),
    );
    gh.factory<_i137.GuidesBloc>(
      () => _i137.GuidesBloc(gh<_i7.ListGuides>(), gh<_i215.SearchGuides>()),
    );
    gh.lazySingleton<_i636.JournalRepository>(
      () => _i547.JournalRepositoryImpl(
        gh<_i80.JournalApi>(),
        gh<_i62.JournalFileDataSource>(),
        gh<_i896.JournalLocalStore>(),
        gh<_i644.JournalEventParser>(),
        gh<_i38.JournalTailDataSource>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i832.GetJournalSessionState>(
      () => _i832.GetJournalSessionState(
        gh<_i636.JournalRepository>(),
        gh<_i1060.JournalSessionAggregator>(),
      ),
    );
    gh.factory<_i832.WatchJournalSessionState>(
      () => _i832.WatchJournalSessionState(
        gh<_i636.JournalRepository>(),
        gh<_i1060.JournalSessionAggregator>(),
      ),
    );
    gh.lazySingleton<_i851.CommanderRepository>(
      () => _i538.CommanderRepositoryImpl(
        gh<_i261.CommanderApi>(),
        gh<_i806.CommanderLocalDataSource>(),
        gh<_i807.Clock>(),
        gh<_i962.AccessTokenProvider>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i13.DiagnosticsRepository>(
      () => _i901.DiagnosticsRepositoryImpl(
        gh<_i395.DiagnosticsApi>(),
        gh<_i892.KeyValueStore>(),
        gh<_i807.Clock>(),
        gh<_i962.AccessTokenProvider>(),
        gh<_i721.PayloadExporter>(),
      ),
    );
    gh.factory<_i832.WatchFieldReport>(
      () => _i832.WatchFieldReport(
        gh<_i636.JournalRepository>(),
        gh<_i1060.JournalSessionAggregator>(),
        gh<_i888.ExobiologyActivityAggregator>(),
        gh<_i661.SystemSurveyBuilder>(),
      ),
    );
    gh.factory<_i694.GetCommanderProfile>(
      () => _i694.GetCommanderProfile(gh<_i851.CommanderRepository>()),
    );
    gh.factory<_i694.RefreshCommanderProfile>(
      () => _i694.RefreshCommanderProfile(gh<_i851.CommanderRepository>()),
    );
    gh.factory<_i694.WatchCommander>(
      () => _i694.WatchCommander(gh<_i851.CommanderRepository>()),
    );
    gh.factory<_i694.GetManualOverrides>(
      () => _i694.GetManualOverrides(gh<_i851.CommanderRepository>()),
    );
    gh.factory<_i694.SaveManualOverrides>(
      () => _i694.SaveManualOverrides(gh<_i851.CommanderRepository>()),
    );
    gh.factory<_i832.WatchJournalEvents>(
      () => _i832.WatchJournalEvents(gh<_i636.JournalRepository>()),
    );
    gh.factory<_i832.SyncJournalFromCompanionApi>(
      () => _i832.SyncJournalFromCompanionApi(gh<_i636.JournalRepository>()),
    );
    gh.factory<_i832.ImportJournalDirectory>(
      () => _i832.ImportJournalDirectory(gh<_i636.JournalRepository>()),
    );
    gh.factory<_i832.GetSuggestedJournalDirectories>(
      () => _i832.GetSuggestedJournalDirectories(gh<_i636.JournalRepository>()),
    );
    gh.factory<_i832.ClearJournal>(
      () => _i832.ClearJournal(gh<_i636.JournalRepository>()),
    );
    gh.factory<_i832.GetExobiologyActivity>(
      () => _i832.GetExobiologyActivity(
        gh<_i636.JournalRepository>(),
        gh<_i888.ExobiologyActivityAggregator>(),
      ),
    );
    gh.lazySingleton<_i611.LiveJournalRepository>(
      () => _i561.LiveJournalRepositoryImpl(
        gh<_i38.JournalTailDataSource>(),
        gh<_i351.GameStateDataSource>(),
        gh<_i62.JournalFileDataSource>(),
        gh<_i896.JournalLocalStore>(),
        gh<_i636.JournalRepository>(),
        gh<_i807.Clock>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i1044.ReadCachedProfile>(
      () => _i1044.ReadCachedProfile(
        gh<_i13.DiagnosticsRepository>(),
        gh<_i653.PayloadInspector>(),
      ),
    );
    gh.factory<_i1044.RefreshProfileCapture>(
      () => _i1044.RefreshProfileCapture(
        gh<_i13.DiagnosticsRepository>(),
        gh<_i653.PayloadInspector>(),
      ),
    );
    gh.factory<_i1044.ReadStoredJournal>(
      () => _i1044.ReadStoredJournal(
        gh<_i13.DiagnosticsRepository>(),
        gh<_i653.PayloadInspector>(),
      ),
    );
    gh.factory<_i820.CommanderBloc>(
      () => _i820.CommanderBloc(
        gh<_i694.WatchCommander>(),
        gh<_i694.RefreshCommanderProfile>(),
        gh<_i694.GetManualOverrides>(),
        gh<_i694.SaveManualOverrides>(),
        gh<_i832.WatchJournalSessionState>(),
      ),
    );
    gh.factory<_i1044.ExportCapture>(
      () => _i1044.ExportCapture(gh<_i13.DiagnosticsRepository>()),
    );
    gh.factory<_i1044.FetchJournalDayCapture>(
      () => _i1044.FetchJournalDayCapture(
        gh<_i13.DiagnosticsRepository>(),
        gh<_i653.PayloadInspector>(),
        gh<_i807.Clock>(),
      ),
    );
    gh.lazySingleton<_i643.CommanderSnapshotSource>(
      () => _i128.CommanderSnapshotAdapter(
        gh<_i851.CommanderRepository>(),
        gh<_i554.ExobiologyProgressRepository>(),
        gh<_i832.GetExobiologyActivity>(),
        gh<_i686.ExobiologyCatalogRepository>(),
        gh<_i832.WatchJournalEvents>(),
        gh<_i832.GetJournalSessionState>(),
      ),
    );
    gh.factory<_i516.DiagnosticsBloc>(
      () => _i516.DiagnosticsBloc(
        gh<_i1044.ReadCachedProfile>(),
        gh<_i1044.RefreshProfileCapture>(),
        gh<_i1044.ReadStoredJournal>(),
        gh<_i1044.FetchJournalDayCapture>(),
        gh<_i1044.ExportCapture>(),
      ),
    );
    gh.factory<_i366.JournalBloc>(
      () => _i366.JournalBloc(
        gh<_i832.WatchJournalEvents>(),
        gh<_i832.SyncJournalFromCompanionApi>(),
        gh<_i832.ImportJournalDirectory>(),
        gh<_i832.GetSuggestedJournalDirectories>(),
        gh<_i888.ExobiologyActivityAggregator>(),
        gh<_i807.Clock>(),
      ),
    );
    gh.factory<_i832.WatchLiveGameState>(
      () => _i832.WatchLiveGameState(gh<_i611.LiveJournalRepository>()),
    );
    gh.factory<_i832.RefreshLiveGameState>(
      () => _i832.RefreshLiveGameState(gh<_i611.LiveJournalRepository>()),
    );
    gh.factory<_i396.GetExobiologyRoadmap>(
      () => _i396.GetExobiologyRoadmap(
        gh<_i643.CommanderSnapshotSource>(),
        gh<_i437.ExobiologyRoadmapEngine>(),
      ),
    );
    gh.factory<_i396.WatchExobiologyRoadmap>(
      () => _i396.WatchExobiologyRoadmap(
        gh<_i643.CommanderSnapshotSource>(),
        gh<_i437.ExobiologyRoadmapEngine>(),
      ),
    );
    gh.factory<_i47.FieldReportBloc>(
      () => _i47.FieldReportBloc(
        gh<_i832.WatchFieldReport>(),
        gh<_i832.WatchLiveGameState>(),
        gh<_i832.RefreshLiveGameState>(),
        gh<_i396.GetExobiologyCatalog>(),
        gh<_i807.Clock>(),
      ),
    );
    gh.factory<_i6.RoadmapBloc>(
      () => _i6.RoadmapBloc(
        gh<_i396.WatchExobiologyRoadmap>(),
        gh<_i396.SetRoadmapStepState>(),
      ),
    );
    return this;
  }
}

class _$CoreModule extends _i154.CoreModule {}

class _$DiagnosticsModule extends _i944.DiagnosticsModule {}

class _$ExobiologyModule extends _i152.ExobiologyModule {}

class _$JournalModule extends _i245.JournalModule {}

class _$MaterialsModule extends _i48.MaterialsModule {}

class _$NetworkModule extends _i200.NetworkModule {}

class _$StorageModule extends _i699.StorageModule {}
