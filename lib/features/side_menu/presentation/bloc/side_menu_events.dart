// Base class for side menu events.
abstract class SideMenuEvent {}

// Event to show the side menu for the home page.
class HomeMenuEvent extends SideMenuEvent {}

// Event to show the side menu for a note page.
class NoteMenuEvent extends SideMenuEvent {}
