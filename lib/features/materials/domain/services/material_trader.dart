import 'package:equatable/equatable.dart';

import '../entities/engineering_material.dart';

/// What a material trader charges for one exchange.
class TraderRate extends Equatable {
  const TraderRate({required this.spend, required this.receive});

  /// Units of the material handed over, for [receive] units back.
  final int spend;
  final int receive;

  @override
  List<Object?> get props => <Object?>[spend, receive];

  @override
  String toString() => '$spend → $receive';
}

/// The material trader's exchange rates.
///
/// Three separate traders — Raw, Manufactured, Encoded — and **no exchange
/// between the three stores**: no amount of data buys an element. Inside one
/// store, crossing to another category multiplies the cost by six.
///
/// The rates have not moved since traders were introduced in February 2018.
/// They are computed here rather than tabulated because the table is generated
/// by two rules, and a rule that reproduces every published row is less likely
/// to hold a typo than thirty-two hand-copied entries — the test checks it
/// against the published table row by row.
abstract final class MaterialTrader {
  /// Going up costs six units per grade; crossing category costs six more.
  static const int _upFactor = 6;

  /// Going down rewards three units per grade — not six. The trader takes a
  /// cut in both directions.
  static const int _downFactor = 3;

  /// What it costs to turn [from] into [to], or null when no trader can.
  ///
  /// Null covers three distinct situations, all real: the two materials live
  /// in different stores; one of them is an Odyssey component, which no trader
  /// handles; or the exchange is arithmetically defined but demands more units
  /// than the commander is allowed to hold, which is the case for every jump
  /// of four grades or more.
  static TraderRate? rateBetween(
    EngineeringMaterial from,
    EngineeringMaterial to,
  ) {
    if (from.id == to.id) {
      return null;
    }
    if (!from.type.hasTrader || from.type != to.type) {
      return null;
    }
    final int? fromGrade = from.grade;
    final int? toGrade = to.grade;
    if (fromGrade == null || toGrade == null) {
      return null;
    }

    final bool sameCategory = from.categoryId == to.categoryId;
    final int delta = toGrade - fromGrade;

    int spend = sameCategory ? 1 : _upFactor;
    int receive = 1;
    if (delta > 0) {
      spend *= _pow(_upFactor, delta);
    } else {
      receive = _pow(_downFactor, -delta);
    }

    final int divisor = _gcd(spend, receive);
    spend ~/= divisor;
    receive ~/= divisor;

    if (spend == 1 && receive == 1) {
      // Same grade, same category: two different materials, and the trader has
      // no rate for that.
      return null;
    }
    // A rate the commander could never assemble is not a rate. The cap is the
    // one on the material being spent.
    final int? cap = from.storageCap;
    if (cap != null && spend > cap) {
      return null;
    }
    return TraderRate(spend: spend, receive: receive);
  }

  /// How many units of [to] the commander could get for [owned] units of
  /// [from], leaving the remainder alone.
  static int yieldFrom(
    EngineeringMaterial from,
    EngineeringMaterial to,
    int owned,
  ) {
    final TraderRate? rate = rateBetween(from, to);
    if (rate == null || owned < rate.spend) {
      return 0;
    }
    return (owned ~/ rate.spend) * rate.receive;
  }

  static int _pow(int base, int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= base;
    }
    return result;
  }

  static int _gcd(int a, int b) => b == 0 ? a : _gcd(b, a % b);
}
