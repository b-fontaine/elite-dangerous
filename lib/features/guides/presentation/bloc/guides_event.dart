part of 'guides_bloc.dart';

sealed class GuidesEvent extends Equatable {
  const GuidesEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// Loads the whole library.
final class GuidesRequested extends GuidesEvent {
  const GuidesRequested();
}

/// Filters the library on title, deck, topics and block text.
final class GuidesSearchChanged extends GuidesEvent {
  const GuidesSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}
