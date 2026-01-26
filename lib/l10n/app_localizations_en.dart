// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get loginHeaderMessage => 'Login to your account';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get forgetPassword => 'Forget Password?';

  @override
  String get dontHaveAccount => 'Don\'t have an account ?';

  @override
  String get signUp => 'Signup';

  @override
  String get or => 'Or';

  @override
  String get googleLogin => 'Login with Google';

  @override
  String get register => 'Register';
}
