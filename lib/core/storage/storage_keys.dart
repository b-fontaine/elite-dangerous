/// Central registry of every persistence key.
///
/// Keeping them in one place makes "clear my data" auditable and prevents two
/// features from silently colliding on the same key.
abstract final class StorageKeys {
  // --- Secure (SecureStore) ---
  static const String accessToken = 'frontier.access_token';
  static const String refreshToken = 'frontier.refresh_token';
  static const String tokenExpiry = 'frontier.token_expiry';

  /// The commander's own EDSM API key. A person's credential, not the app's,
  /// so it belongs beside the Frontier tokens rather than in preferences.
  static const String edsmApiKey = 'edsm.api_key';
  static const String pkceVerifier = 'frontier.pkce_verifier';
  static const String oauthState = 'frontier.oauth_state';
  static const String oauthClientId = 'frontier.oauth_client_id';

  // --- Plain (KeyValueStore) ---
  static const String oauthRedirectUri = 'frontier.oauth_redirect_uri';
  static const String commanderProfile = 'commander.profile';
  static const String commanderManualOverrides = 'commander.manual_overrides';
  static const String commanderLastSync = 'commander.last_sync';

  static const String journalEvents = 'journal.events';
  static const String journalLastSyncedDay = 'journal.last_synced_day';
  static const String journalSettledDays = 'journal.settled_days';
  static const String journalLocalFolder = 'journal.local_folder';

  static const String exobiologyProgress = 'exobiology.progress';
  static const String exobiologyRoadmapOverrides = 'exobiology.roadmap_overrides';
  static const String exobiologyFinderHistory = 'exobiology.finder_history';

  /// Answers fetched from Spansh, keyed on `id64`. Not the commander's data:
  /// a public record of the galaxy, kept locally so it is asked for once.
  static const String systemLookupSystems = 'system_lookup.systems';
  static const String systemLookupBodies = 'system_lookup.bodies';

  /// The route being flown, and the ones flown before it. Only the plan is
  /// stored: progress is derived from the journal on every read.
  static const String routeActive = 'route.active';
  /// Systems fetched from Frontier's visited-stars cache and from EDSM.
  ///
  /// The one index this app stores rather than derives: neither source is on
  /// disk, and re-deriving would mean spending EDSM's hourly budget again.
  static const String routeHistorySystems = 'route.history_systems';
  static const String routeHistoryNames = 'route.history_names';
  static const String routeHistoryCursor = 'route.history_cursor';
  static const String edsmCommanderName = 'route.edsm_commander';

  /// The game machine this device reads its route from, as `host:port/token`.
  static const String routeBridgePairing = 'route.bridge_pairing';
  static const String routeArchive = 'route.archive';

  static const String guidesReadState = 'guides.read_state';
  static const String settingsThemeDensity = 'settings.theme_density';
  static const String settingsOnboardingDone = 'settings.onboarding_done';

  /// Every key wiped by the "reset local data" action.
  static const List<String> resettable = <String>[
    commanderProfile,
    commanderManualOverrides,
    commanderLastSync,
    journalEvents,
    journalLastSyncedDay,
    journalSettledDays,
    journalLocalFolder,
    exobiologyProgress,
    exobiologyRoadmapOverrides,
    exobiologyFinderHistory,
    routeActive,
    routeHistorySystems,
    routeHistoryNames,
    routeHistoryCursor,
    edsmCommanderName,
    routeBridgePairing,
    routeArchive,
    systemLookupSystems,
    systemLookupBodies,
    guidesReadState,
  ];
}
