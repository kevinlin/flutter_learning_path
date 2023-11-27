import 'package:flutter_learning_path/common/logger.dart';
import 'package:jwt_decode/jwt_decode.dart';

abstract class AuthService {
  bool isTokenValid(String token);
}

class DefaultAuthService implements AuthService {
  @override
  bool isTokenValid(String token) {
    try {
      if (token.isEmpty) return false;

      final decodedJwt = Jwt.parseJwt(token);

      // Extract the expiration claim from the decoded JWT
      final expiration = DateTime.fromMillisecondsSinceEpoch(decodedJwt['exp'] * 1000);

      // Compare the expiration time with the current time
      if (expiration.isAfter(DateTime.now())) {
        return true;
      }
    } catch (e) {
      logger.d("Unexpected error occurred $e");
    }
    return false;
  }
}
