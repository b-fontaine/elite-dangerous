import 'package:equatable/equatable.dart';

/// The bits of `Status.json`'s `Flags`, named.
///
/// Written as shifts rather than as the decimal constants the Journal manual
/// prints, because `2097152` says nothing and `1 << 21` at least says which
/// bit it is. The order below is the manual's order, so the two can be read
/// side by side.
abstract final class StatusFlag {
  static const int docked = 1 << 0;
  static const int landed = 1 << 1;
  static const int landingGearDown = 1 << 2;
  static const int shieldsUp = 1 << 3;
  static const int supercruise = 1 << 4;
  static const int flightAssistOff = 1 << 5;
  static const int hardpointsDeployed = 1 << 6;
  static const int inWing = 1 << 7;
  static const int lightsOn = 1 << 8;
  static const int cargoScoopDeployed = 1 << 9;
  static const int silentRunning = 1 << 10;
  static const int scoopingFuel = 1 << 11;
  static const int srvHandbrake = 1 << 12;
  static const int srvTurretView = 1 << 13;
  static const int srvTurretRetracted = 1 << 14;
  static const int srvDriveAssist = 1 << 15;
  static const int fsdMassLocked = 1 << 16;
  static const int fsdCharging = 1 << 17;
  static const int fsdCooldown = 1 << 18;
  static const int lowFuel = 1 << 19;
  static const int overHeating = 1 << 20;
  static const int hasLatLong = 1 << 21;
  static const int inDanger = 1 << 22;
  static const int beingInterdicted = 1 << 23;
  static const int inMainShip = 1 << 24;
  static const int inFighter = 1 << 25;
  static const int inSrv = 1 << 26;
  static const int analysisMode = 1 << 27;
  static const int nightVision = 1 << 28;
  static const int altitudeFromAverageRadius = 1 << 29;
  static const int fsdJump = 1 << 30;
  static const int srvHighBeam = 1 << 31;
}

/// The bits of `Flags2`, which Odyssey added for the commander on foot.
abstract final class StatusFlag2 {
  static const int onFoot = 1 << 0;
  static const int inTaxi = 1 << 1;
  static const int inMulticrew = 1 << 2;
  static const int onFootInStation = 1 << 3;
  static const int onFootOnPlanet = 1 << 4;
  static const int aimDownSight = 1 << 5;
  static const int lowOxygen = 1 << 6;
  static const int lowHealth = 1 << 7;
  static const int cold = 1 << 8;
  static const int hot = 1 << 9;
  static const int veryCold = 1 << 10;
  static const int veryHot = 1 << 11;
  static const int glideMode = 1 << 12;
  static const int onFootInHangar = 1 << 13;
  static const int onFootSocialSpace = 1 << 14;
  static const int onFootExterior = 1 << 15;
  static const int breathableAtmosphere = 1 << 16;
  static const int telepresenceMulticrew = 1 << 17;
  static const int physicalMulticrew = 1 << 18;
  static const int fsdHyperdriveCharging = 1 << 19;
}

/// Where the commander's next jump is pointed.
class StatusDestination extends Equatable {
  const StatusDestination({this.systemAddress, this.bodyId, this.name});

  final int? systemAddress;
  final int? bodyId;

  /// What the game calls it — a body name, a station, or a signal source.
  final String? name;

  bool get isSet => (name != null && name!.isNotEmpty) || systemAddress != null;

  @override
  List<Object?> get props => <Object?>[systemAddress, bodyId, name];
}

/// `Status.json`, the one file the game rewrites as things happen rather than
/// once they are over.
///
/// The journal says where the commander *went*; this says where they *are*,
/// down to the latitude on a planet. It is the difference between a log and a
/// dashboard, and it is why the live view reads both.
///
/// Every field is nullable because the file's shape depends on the situation:
/// there is no latitude in supercruise, no oxygen in a ship, and no `Flags2`
/// at all on a Horizons client.
class GameStatus extends Equatable {
  const GameStatus({
    required this.at,
    this.flags = 0,
    this.flags2 = 0,
    this.bodyName,
    this.latitude,
    this.longitude,
    this.headingDegrees,
    this.altitudeM,
    this.planetRadiusM,
    this.fuelMainT,
    this.fuelReservoirT,
    this.cargoT,
    this.balanceCr,
    this.legalState,
    this.destination,
    this.temperatureK,
    this.gravityG,
    this.oxygen,
    this.health,
  });

  /// The file's own timestamp, not the moment it was read: a `Status.json`
  /// that has not moved in an hour means the game is closed, and the UI has to
  /// be able to say so.
  final DateTime at;

  final int flags;
  final int flags2;

  final String? bodyName;
  final double? latitude;
  final double? longitude;
  final double? headingDegrees;
  final double? altitudeM;
  final double? planetRadiusM;

  final double? fuelMainT;
  final double? fuelReservoirT;
  final int? cargoT;
  final int? balanceCr;
  final String? legalState;

  final StatusDestination? destination;

  /// Ambient temperature outside the suit, in Kelvin.
  final double? temperatureK;

  /// Already in g — the file reports it that way for the commander on foot.
  final double? gravityG;

  /// 0.0 → 1.0, both of them.
  final double? oxygen;
  final double? health;

  bool has(int flag) => flags & flag != 0;

  bool has2(int flag) => flags2 & flag != 0;

  bool get docked => has(StatusFlag.docked);
  bool get landed => has(StatusFlag.landed);
  bool get supercruise => has(StatusFlag.supercruise);
  bool get inHyperspace => has(StatusFlag.fsdJump);
  bool get hasLatLong => has(StatusFlag.hasLatLong);
  bool get inSrv => has(StatusFlag.inSrv);
  bool get inMainShip => has(StatusFlag.inMainShip);
  bool get inFighter => has(StatusFlag.inFighter);
  bool get analysisMode => has(StatusFlag.analysisMode);
  bool get nightVision => has(StatusFlag.nightVision);
  bool get lowFuel => has(StatusFlag.lowFuel);

  bool get onFoot => has2(StatusFlag2.onFoot);
  bool get inTaxi => has2(StatusFlag2.inTaxi);
  bool get onFootOnPlanet => has2(StatusFlag2.onFootOnPlanet);
  bool get onFootInStation => has2(StatusFlag2.onFootInStation);
  bool get breathableAtmosphere => has2(StatusFlag2.breathableAtmosphere);
  bool get lowOxygen => has2(StatusFlag2.lowOxygen);
  bool get glideMode => has2(StatusFlag2.glideMode);

  /// The commander is standing on a surface with a suit on.
  ///
  /// The check that matters before saying "you can sample here": the Genetic
  /// Sampler only works on foot, outside, on a planet.
  bool get canSampleHere =>
      onFoot &&
      onFootOnPlanet &&
      !onFootInStation &&
      !has2(StatusFlag2.onFootInHangar);

  /// A `Status.json` where nothing at all is set.
  ///
  /// The game writes exactly this — `{"Flags":0}` — while sitting in the main
  /// menu, and it is the one honest way to know nobody is flying.
  bool get isInMainMenu => flags == 0 && flags2 == 0;

  /// What the commander is doing, in one word, in the vocabulary
  /// `CommanderPosition.activity` already uses — the two appear side by side,
  /// and two wordings for one idea would read as two different facts.
  String get activity {
    if (inHyperspace) {
      return 'en hyperespace';
    }
    if (onFoot) {
      return onFootInStation ? 'à pied, en station' : 'à pied';
    }
    if (inSrv) {
      return 'en SRV';
    }
    if (docked) {
      return 'amarré';
    }
    if (landed) {
      return 'posé';
    }
    if (supercruise) {
      return 'en supercruise';
    }
    return 'en vol';
  }

  @override
  List<Object?> get props => <Object?>[
        at,
        flags,
        flags2,
        bodyName,
        latitude,
        longitude,
        headingDegrees,
        altitudeM,
        planetRadiusM,
        fuelMainT,
        fuelReservoirT,
        cargoT,
        balanceCr,
        legalState,
        destination,
        temperatureK,
        gravityG,
        oxygen,
        health,
      ];
}
