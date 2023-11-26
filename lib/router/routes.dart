import 'package:equatable/equatable.dart';

class Routes extends Equatable {
  static const initial = '/';
  static const signUp = '/sign-up';

  @override
  List<Object?> get props => [
        initial,
        signUp,
      ];
}
