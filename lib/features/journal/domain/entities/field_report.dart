import 'package:equatable/equatable.dart';

import 'exobiology_activity.dart';
import 'journal_session_state.dart';
import 'system_survey.dart';

/// Everything one reading of the journal says about the commander in the
/// field, gathered so the three answers cannot disagree.
///
/// The three parts are computed from the same list of events in the same pass.
/// Watching them separately would have worked and would have been wrong in a
/// visible way: the survey would name a system the position had already left,
/// for as long as the two streams took to settle.
class FieldReport extends Equatable {
  const FieldReport({
    this.session = const JournalSessionState.empty(),
    this.activity = const ExobiologyActivity(),
    this.survey = const SystemSurvey.unknown(),
  });

  const FieldReport.empty() : this();

  /// Where the commander is, and what they are carrying.
  final JournalSessionState session;

  /// The exobiology career, and what is sampled but not yet sold.
  final ExobiologyActivity activity;

  /// What is left to do in the system they are standing in.
  final SystemSurvey survey;

  bool get isEmpty => session.isEmpty && !survey.isKnown;

  @override
  List<Object?> get props => <Object?>[session, activity, survey];
}
