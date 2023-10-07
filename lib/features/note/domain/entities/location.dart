enum Location { localStorage, cloud }

Location toLocation(String arg) {
  if (arg == 'localStorage') return Location.localStorage;
  return Location.cloud;
}
