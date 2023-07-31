part of 'authentication_cubit.dart';

enum AuthenticationStatus { initial, loading, success, failure }

extension ItemStatusX on AuthenticationStatus {
  bool get isInitial => this == AuthenticationStatus.initial;

  bool get isLoading => this == AuthenticationStatus.loading;

  bool get isSuccess => this == AuthenticationStatus.success;

  bool get isFailure => this == AuthenticationStatus.failure;
}

@JsonSerializable()
class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.initial,
    this.accessKey
  });

  final AuthenticationStatus status;
  final String? accessKey;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    String? accessKey,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      accessKey: accessKey ?? this.accessKey
    );
  }

  @override
  List<Object?> get props => [status, accessKey];
}
