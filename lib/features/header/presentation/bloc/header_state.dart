abstract class HeaderState {
  final String title;

  HeaderState(this.title);
}

class NoUserHeaderState extends HeaderState {
  NoUserHeaderState(super.title);
}

class UserAvailableHeaderState extends HeaderState {
  final String? userName;
  final String? photoUrl;

  UserAvailableHeaderState(
    super.title, {
    this.userName,
    this.photoUrl,
  });
}
