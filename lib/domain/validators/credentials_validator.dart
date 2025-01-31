import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialsValidator extends LucidValidator<Credentials> {
  CredentialsValidator() {
    ruleFor((c) => c.username, key: 'username').notEmpty();
    ruleFor((c) => c.password, key: 'password').notEmpty().minLength(6);
    ruleFor((c) => c.clientId, key: 'clientId').notEmpty();
    ruleFor((c) => c.clientSecret, key: 'clientSecret').notEmpty();
  }
}
