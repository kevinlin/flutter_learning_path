import 'package:equatable/equatable.dart';

class Routes extends Equatable {
  static const initial = '/';
  static const signUp = '/sign-up';
  static const signIn = '/sign-in';
  static const upcoming = '/upcoming';

  @override
  List<Object?> get props => [
        initial,
        signUp,
        signIn,
        upcoming,
      ];
}
