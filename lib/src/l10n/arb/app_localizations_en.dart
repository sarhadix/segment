// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get wordContinue => 'Continue';

  @override
  String get noSubImportedText =>
      'To connect to unrestricted internet,\nyou need a subscription link.';

  @override
  String get wordImport => 'Import';

  @override
  String get checkInternetConnection =>
      'Check your internet connection status !';

  @override
  String get slideToDisconnect => 'Slide to disconnect';

  @override
  String get activeTimeText => 'ACTIVE TIME';

  @override
  String get hasActiveSub_MainScreen =>
      'To improve the connection conditions, \nyou can always import another config \nor subscription.';
}
