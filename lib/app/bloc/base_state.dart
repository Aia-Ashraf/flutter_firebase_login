part of 'base_bloc.dart';

enum BaseStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(status: BaseStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: BaseStatus.unauthenticated);

  final BaseStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
