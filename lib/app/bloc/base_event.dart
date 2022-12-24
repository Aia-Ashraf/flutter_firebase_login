part of 'base_bloc.dart';

abstract class BaseEvent {
  const BaseEvent();
}

class AppLogoutRequested extends BaseEvent {
  const AppLogoutRequested();
}

class _AppUserChanged extends BaseEvent {
  const _AppUserChanged(this.user);

  final User user;
}
