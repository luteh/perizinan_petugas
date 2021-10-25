import 'package:equatable/equatable.dart';

class CodeVerificationArgs extends Equatable {
  final String email;

  const CodeVerificationArgs({required this.email});

  @override
  List<Object> get props => [email];
}
