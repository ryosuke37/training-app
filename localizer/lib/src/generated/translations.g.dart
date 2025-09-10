/// Generated file. Do not edit.
///
/// Original: lib/src/input
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 56 (28 per locale)
///
/// Built on 2024-02-23 at 01:40 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
	en(languageCode: 'en', build: _TranslationsEn.build),
	ja(languageCode: 'ja', build: _TranslationsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _TranslationsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_TranslationsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _TranslationsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_TranslationsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	String get language => 'language';
	String get settings => 'settings';
	String get english => 'English';
	String get japanese => 'Japanese';
	String get home => 'home';
	String get graph => 'graph';
	String get theme => 'theme';
	String get blueDark => 'dark blue';
	String get blueLight => 'light blue';
	String get greenDark => 'dark green';
	String get greenLight => 'light green';
	String pageNumber({required Object num, required Object parent}) => 'page ${num} of ${parent} tab';
	String get nextPage => 'Next page';
	String get back => 'Back';
	String get timer => 'timer';
	String get start => 'Start';
	String get stop => 'Stop';
	String get cancel => 'Cancel';
	String get hours => 'hours';
	String get minutes => 'min';
	String get seconds => 'sec';
	String get ready => 'Ready';
	String get workOut => 'Work out';
	String get routineList => 'Routine List';
	String get routineName => 'routine name';
	String get description => 'description';
	String get action => 'action';
	String get repeatNum => 'repeat';
}

// Path: <root>
class _TranslationsJa extends _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _TranslationsJa _root = this; // ignore: unused_field

	// Translations
	@override String get language => '言語';
	@override String get settings => '設定';
	@override String get english => '英語';
	@override String get japanese => '日本語';
	@override String get home => 'ホーム';
	@override String get graph => 'グラフ';
	@override String get theme => 'テーマ';
	@override String get blueDark => 'ダークブルー';
	@override String get blueLight => 'ライトブルー';
	@override String get greenDark => 'ダークグリーン';
	@override String get greenLight => 'ライトグリーン';
	@override String pageNumber({required Object parent, required Object num}) => '${parent}タブ ${num} ページ';
	@override String get nextPage => '次のページ';
	@override String get back => '戻る';
	@override String get timer => 'タイマー';
	@override String get start => '開始';
	@override String get stop => '停止';
	@override String get cancel => 'キャンセル';
	@override String get hours => '時間';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get ready => '準備';
	@override String get workOut => 'ワークアウト';
	@override String get routineList => 'ルーティーンリスト';
	@override String get routineName => 'ルーティーン名';
	@override String get description => '概要';
	@override String get action => '行動';
	@override String get repeatNum => '繰り返し回数';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'language';
			case 'settings': return 'settings';
			case 'english': return 'English';
			case 'japanese': return 'Japanese';
			case 'home': return 'home';
			case 'graph': return 'graph';
			case 'theme': return 'theme';
			case 'blueDark': return 'dark blue';
			case 'blueLight': return 'light blue';
			case 'greenDark': return 'dark green';
			case 'greenLight': return 'light green';
			case 'pageNumber': return ({required Object num, required Object parent}) => 'page ${num} of ${parent} tab';
			case 'nextPage': return 'Next page';
			case 'back': return 'Back';
			case 'timer': return 'timer';
			case 'start': return 'Start';
			case 'stop': return 'Stop';
			case 'cancel': return 'Cancel';
			case 'hours': return 'hours';
			case 'minutes': return 'min';
			case 'seconds': return 'sec';
			case 'ready': return 'Ready';
			case 'workOut': return 'Work out';
			case 'routineList': return 'Routine List';
			case 'routineName': return 'routine name';
			case 'description': return 'description';
			case 'action': return 'action';
			case 'repeatNum': return 'repeat';
			default: return null;
		}
	}
}

extension on _TranslationsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return '言語';
			case 'settings': return '設定';
			case 'english': return '英語';
			case 'japanese': return '日本語';
			case 'home': return 'ホーム';
			case 'graph': return 'グラフ';
			case 'theme': return 'テーマ';
			case 'blueDark': return 'ダークブルー';
			case 'blueLight': return 'ライトブルー';
			case 'greenDark': return 'ダークグリーン';
			case 'greenLight': return 'ライトグリーン';
			case 'pageNumber': return ({required Object parent, required Object num}) => '${parent}タブ ${num} ページ';
			case 'nextPage': return '次のページ';
			case 'back': return '戻る';
			case 'timer': return 'タイマー';
			case 'start': return '開始';
			case 'stop': return '停止';
			case 'cancel': return 'キャンセル';
			case 'hours': return '時間';
			case 'minutes': return '分';
			case 'seconds': return '秒';
			case 'ready': return '準備';
			case 'workOut': return 'ワークアウト';
			case 'routineList': return 'ルーティーンリスト';
			case 'routineName': return 'ルーティーン名';
			case 'description': return '概要';
			case 'action': return '行動';
			case 'repeatNum': return '繰り返し回数';
			default: return null;
		}
	}
}
