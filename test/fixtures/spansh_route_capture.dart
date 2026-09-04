/// A real answer from Spansh's exobiology plotter, captured on 3 September
/// 2026 and trimmed to three waypoints.
///
/// Captured rather than written, because two properties of this payload are
/// easy to get wrong from the documentation — there is none — and impossible
/// to get wrong from a real one:
///
/// * `id64` arrives as a **string** on both systems and bodies, while the same
///   number appears as an int under a body's `id`.
/// * the first waypoint is the departure system and reports `jumps: 1`, which
///   is an artefact: the legs measure 87.9 and 76.1 ly at a 50 ly range, and
///   Spansh reports 2 jumps for each. The commander is already at the first.
///
/// Request that produced it: `from=Sol, range=50, radius=100, max_results=4,
/// max_distance=5000, loop=0, avoid_thargoids=1`.
library;

const String spanshExobiologyRouteCapture = r'''
{
  "job": "441AF47A-A797-11F1-B31E-E7A19907C927",
  "result": [
    {
      "bodies": [],
      "id64": "10477373803",
      "jumps": 1,
      "name": "Sol",
      "x": 0,
      "y": 0,
      "z": 0
    },
    {
      "bodies": [
        {
          "distance_to_arrival": 759.729617,
          "estimated_mapping_value": 2221,
          "estimated_scan_value": 500,
          "id": 252203548115208563,
          "id64": "252203548115208563",
          "landmark_value": 67059100,
          "landmarks": [
            {
              "count": 78,
              "subtype": "Cactoida Vermis",
              "type": "Cactoida",
              "value": 16202800
            },
            {
              "count": 78,
              "subtype": "Tussock Virgam",
              "type": "Tussock",
              "value": 14313700
            },
            {
              "count": 36,
              "subtype": "Osseus Discus",
              "type": "Osseus",
              "value": 12934900
            }
          ],
          "name": "Borfor 1 d",
          "subtype": "Rocky body",
          "type": "Planet"
        },
        {
          "distance_to_arrival": 768.093014,
          "estimated_mapping_value": 2221,
          "estimated_scan_value": 500,
          "id": 180145954077280627,
          "id64": "180145954077280627",
          "landmark_value": 67059100,
          "landmarks": [
            {
              "count": 89,
              "subtype": "Cactoida Vermis",
              "type": "Cactoida",
              "value": 16202800
            },
            {
              "count": 130,
              "subtype": "Tussock Virgam",
              "type": "Tussock",
              "value": 14313700
            },
            {
              "count": 31,
              "subtype": "Osseus Discus",
              "type": "Osseus",
              "value": 12934900
            }
          ],
          "name": "Borfor 1 b",
          "subtype": "Rocky body",
          "type": "Planet"
        }
      ],
      "id64": "1968982460787",
      "jumps": 2,
      "name": "Borfor",
      "x": -1.09375,
      "y": 21.21875,
      "z": 85.25
    },
    {
      "bodies": [
        {
          "distance_to_arrival": 1395.484513,
          "estimated_mapping_value": 2221,
          "estimated_scan_value": 500,
          "id": 1441157462169293530,
          "id64": "1441157462169293530",
          "landmark_value": 12002400,
          "landmarks": [
            {
              "count": 14,
              "subtype": "Frutexa Acus",
              "type": "Frutexa",
              "value": 7774700
            },
            {
              "count": 13,
              "subtype": "Tussock Ventusa",
              "type": "Tussock",
              "value": 3227700
            },
            {
              "count": 10,
              "subtype": "Bacterium Aurasus",
              "type": "Bacterium",
              "value": 1000000
            }
          ],
          "name": "Domoirene A 9 d",
          "subtype": "Rocky body",
          "type": "Planet"
        },
        {
          "distance_to_arrival": 3421.884816,
          "estimated_mapping_value": 2221,
          "estimated_scan_value": 500,
          "id": 2197762199567536858,
          "id64": "2197762199567536858",
          "landmark_value": 53411500,
          "landmarks": [
            {
              "count": 37,
              "subtype": "Clypeus Speculumi",
              "type": "Clypeus",
              "value": 16202800
            },
            {
              "count": 33,
              "subtype": "Osseus Pellebantus",
              "type": "Osseus",
              "value": 9739000
            },
            {
              "count": 29,
              "subtype": "Frutexa Acus",
              "type": "Frutexa",
              "value": 7774700
            }
          ],
          "name": "Domoirene A 12 d",
          "subtype": "Rocky body",
          "type": "Planet"
        }
      ],
      "id64": "5581410734810",
      "jumps": 2,
      "name": "Domoirene",
      "x": -22.96875,
      "y": 79.75,
      "z": 41.84375
    }
  ],
  "state": "completed",
  "status": "ok"
}
''';
