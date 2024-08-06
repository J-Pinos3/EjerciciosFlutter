import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }


// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  
  static final RegExp emailRegExp = RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Call super.pure to represent an unmodified form input. initial value
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input. field has changed by user
  const Email.dirty( String value ) : super.dirty(value);


  String? get errorMessage{
    if( isValid || isPure ){
      return null;
    }

    if( displayError == EmailError.empty ){  return "El campo es requerido";  }
    if( displayError == EmailError.format ){  return "El formato es incorrecto";  }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {

    if(value.isEmpty || value.trim().isEmpty){   return EmailError.empty;   }

    if( !emailRegExp.hasMatch(value) ){  return EmailError.format;  }

    return null;
  }
}