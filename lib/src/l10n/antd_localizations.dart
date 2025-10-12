import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'antd_localizations_en.dart';
import 'antd_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AntdLocalizations
/// returned by `AntdLocalizations.of(context)`.
///
/// Applications need to include `AntdLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/antd_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AntdLocalizations.localizationsDelegates,
///   supportedLocales: AntdLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
/// be consistent with the languages listed in the AntdLocalizations.supportedLocales
/// property.
abstract class AntdLocalizations {
  AntdLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AntdLocalizations? of(BuildContext context) {
    return Localizations.of<AntdLocalizations>(context, AntdLocalizations);
  }

  static const LocalizationsDelegate<AntdLocalizations> delegate =
      _AntdLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale.fromSubtags(
      languageCode: 'zh',
      countryCode: 'CN',
      scriptCode: 'Hans',
    ),
  ];

  /// No description provided for @button_ok.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'确定'**
  String get button_ok;

  /// No description provided for @button_cancel.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'取消'**
  String get button_cancel;

  /// No description provided for @button_close.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'关闭'**
  String get button_close;

  /// No description provided for @button_confirm.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'确定'**
  String get button_confirm;

  /// No description provided for @calendar_mon.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'一'**
  String get calendar_mon;

  /// No description provided for @calendar_tue.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'二'**
  String get calendar_tue;

  /// No description provided for @calendar_wed.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'三'**
  String get calendar_wed;

  /// No description provided for @calendar_thu.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'四'**
  String get calendar_thu;

  /// No description provided for @calendar_fir.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'五'**
  String get calendar_fir;

  /// No description provided for @calendar_sat.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'六'**
  String get calendar_sat;

  /// No description provided for @calendar_sun.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'日'**
  String get calendar_sun;

  /// No description provided for @cascader_placeholder.
  ///
  /// In zh_Hans_CN, this message translates to:
  /// **'请选择'**
  String get cascader_placeholder;
}

class _AntdLocalizationsDelegate
    extends LocalizationsDelegate<AntdLocalizations> {
  const _AntdLocalizationsDelegate();

  @override
  Future<AntdLocalizations> load(Locale locale) {
    return SynchronousFuture<AntdLocalizations>(
      lookupAntdLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AntdLocalizationsDelegate old) => false;
}

AntdLocalizations lookupAntdLocalizations(Locale locale) {
  // Lookup logic when language+script+country codes are specified.
  switch (locale.toString()) {
    case 'zh_Hans_CN':
      return AntdLocalizationsZhHansCn();
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AntdLocalizationsEn();
    case 'zh':
      return AntdLocalizationsZh();
  }

  throw FlutterError(
    'AntdLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
