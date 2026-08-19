/// How far, and how insistently, a Companion API sync is allowed to walk.
///
/// It lives in the domain because it is policy, not plumbing: the numbers come
/// from what Frontier tolerates and from what the app needs out of a journal,
/// and both the use case that builds a range and the repository that walks it
/// have to agree on them.
abstract final class JournalSyncPolicy {
  /// How far back a single sync will ever reach.
  ///
  /// Frontier documents no retention window for `/journal`, so there is no
  /// figure to honour — only a ceiling that keeps a runaway loop from walking
  /// back to 2014. The walk almost always stops on its own long before this,
  /// and at the spacing the network layer imposes on the journal endpoint the
  /// worst case is a little over two minutes — once, since settled days are
  /// remembered.
  static const int maxSyncDays = 90;

  /// What a plain "synchronise" reaches for.
  static const int defaultSyncDays = 14;

  /// Consecutive empty days that end the walk.
  ///
  /// Frontier answers `204` both for a day the commander did not play and for
  /// one it no longer keeps, and gives no way to tell them apart. Three weeks
  /// of silence means one or the other, and the response to both is to stop
  /// rather than spend the rest of the budget on empty days.
  static const int quietDaysBeforeStopping = 21;
}
