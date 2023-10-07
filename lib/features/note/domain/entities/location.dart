/// An enum for storage locations.
enum Location { localStorage, cloud }

/// Returns String parsed to [Location].
Location toLocation(String arg) {
  if (arg == 'localStorage') return Location.localStorage;
  return Location.cloud;
}
