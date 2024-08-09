// lib/blocs/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.login(event.email, event.password);
        emit(AuthSuccess('Login successful'));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<AuthRegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.register(
          event.name,
          event.email,
          event.password,
          event.confirmPassword,
        );
        emit(AuthSuccess('Registration successful'));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.logout();
        emit(AuthSuccess('Logout successful'));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
