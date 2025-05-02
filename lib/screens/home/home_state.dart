class HomeState {
  final double? balance;
  final bool? follow;

  HomeState({
     this.balance,
     this.follow
  });

  HomeState copyWith({
    double? balance,
    bool? follow,
  }) {
    return HomeState(
      balance: balance ?? this.balance,
      follow: follow?? this.follow
    );
  }
}
