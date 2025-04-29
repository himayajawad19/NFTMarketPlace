class HomeState {
  final double balance;

  HomeState({
    required this.balance,
  });

  HomeState copyWith({
    double? balance,
  }) {
    return HomeState(
      balance: balance ?? this.balance,
    );
  }
}
