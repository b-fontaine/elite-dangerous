/// Central registry of every persistence key.
///
/// Keeping them in one place makes "clear my data" auditable and prevents two
/// features from silently colliding on the same key.
abstract final class StorageKeys {
  // --- Secure (SecureStore) ---
  static const String accessToken = 'frontier.access_token';
  static const String refreshToken = 'frontier.refresh_token';
  static const String tokenExpiry = 'frontier.token_expiry';
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
    guidesReadState,
  ];
}
