abstract class HeaderEvent {}

class SetHeaderTitle extends HeaderEvent {
  final String title;

  SetHeaderTitle(this.title);
}
