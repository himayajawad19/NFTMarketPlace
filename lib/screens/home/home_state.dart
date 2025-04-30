class HomeState {
  final double? balance;

  HomeState({
     this.balance,
  });

  HomeState copyWith({
    double? balance,
  }) {
    return HomeState(
      balance: balance ?? this.balance,
    );
  }
}
