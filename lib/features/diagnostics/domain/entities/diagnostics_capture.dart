import 'package:equatable/equatable.dart';

import 'payload_inspection.dart';
import 'raw_payload.dart';

/// A `/profile` capture and what reading it revealed.
class ProfileCapture extends Equatable {
  const ProfileCapture({required this.payload, required this.inspection});

  final RawPayload payload;
  final ProfileInspection inspection;

  @override
  List<Object?> get props => <Object?>[payload, inspection];
}

/// A journal capture and what reading it revealed.
class JournalCapture extends Equatable {
  const JournalCapture({required this.payload, required this.inspection});

  final RawPayload payload;
  final JournalInspection inspection;

  @override
  List<Object?> get props => <Object?>[payload, inspection];
}
