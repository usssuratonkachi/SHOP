import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repository/repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._accessKeyRepository)
      : super(const AuthenticationState());

  final AccessKeyRepository _accessKeyRepository;

  Future<void> fetchAccessKey() async {
    emit(state.copyWith(status: AuthenticationStatus.loading));

    try {
      _accessKeyRepository.setAccessKey();

      final accessKey = _accessKeyRepository.getAccessKey();
      emit(state.copyWith(
          status: AuthenticationStatus.success, accessKey: accessKey));
    } on Exception {
      emit(state.copyWith(status: AuthenticationStatus.failure));
    }
  }
}
