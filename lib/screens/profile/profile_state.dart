class ProfileState {
  final String? Followers;
  final String? Following;
  ProfileState({this.Followers, this.Following});

  ProfileState copyWith({String? Followers, String? Following}) {
    return ProfileState(Followers: Followers, Following: Following);
  }
}
