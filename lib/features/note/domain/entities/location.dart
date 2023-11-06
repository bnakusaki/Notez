/// An enum of storage locations.
enum Location { localStorage, cloud }

/// Parses formatted [String] to [Location].
Location toLocation(String arg) {
  if (arg == 'localStorage') return Location.localStorage;
  return Location.cloud;
}
