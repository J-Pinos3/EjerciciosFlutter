import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infraestructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super( const RegisterFormState());

  void onSubmit(){
    print("Submit: $state");
  }

  void usernameChanged( String value ) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username:  username,
        isValid: Formz.validate([username, state.password]),//it calls the validator function of each Formz input
      )
    );
  }

  void emailChanged( String value ) {
    emit(
      state.copyWith( email: value )
    );
  }

  void passwordChanged( String value ){
    final Password password = Password.dirty(value);
    emit(
      state.copyWith( 
        password: password,
        isValid: Formz.validate([ state.username, password])
      )
    );
  }
}
