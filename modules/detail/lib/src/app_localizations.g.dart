
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

/// Callers can lookup localized strings with an instance of AppLocalizationsDetail returned
/// by `AppLocalizationsDetail.of(context)`.
///
/// Applications need to include `AppLocalizationsDetail.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'src/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizationsDetail.localizationsDelegates,
///   supportedLocales: AppLocalizationsDetail.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizationsDetail.supportedLocales
/// property.
abstract class AppLocalizationsDetail {
  AppLocalizationsDetail(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizationsDetail? of(BuildContext context) {
    return Localizations.of<AppLocalizationsDetail>(context, AppLocalizationsDetail);
  }

  static const LocalizationsDelegate<AppLocalizationsDetail> delegate = _AppLocalizationsDetailDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'localize_modular'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'detail page'**
  String get home;
}

class _AppLocalizationsDetailDelegate extends LocalizationsDelegate<AppLocalizationsDetail> {
  const _AppLocalizationsDetailDelegate();

  @override
  Future<AppLocalizationsDetail> load(Locale locale) {
    return SynchronousFuture<AppLocalizationsDetail>(lookupAppLocalizationsDetail(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDetailDelegate old) => false;
}

AppLocalizationsDetail lookupAppLocalizationsDetail(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsDetailEn();
    case 'id': return AppLocalizationsDetailId();
  }

  throw FlutterError(
    'AppLocalizationsDetail.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
