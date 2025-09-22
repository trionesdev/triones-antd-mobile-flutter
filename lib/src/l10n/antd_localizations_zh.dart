import 'antd_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AntdLocalizationsZh extends AntdLocalizations {
  AntdLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get button_ok => '确定';

  @override
  String get button_cancel => '取消';

  @override
  String get button_close => '关闭';

  @override
  String get button_confirm => '确定';
}

/// The translations for Chinese, as used in China, using the Han script (`zh_Hans_CN`).
class AntdLocalizationsZhHansCn extends AntdLocalizationsZh {
  AntdLocalizationsZhHansCn(): super('zh_Hans_CN');

  @override
  String get button_ok => '确定';

  @override
  String get button_cancel => '取消';

  @override
  String get button_close => '关闭';

  @override
  String get button_confirm => '确定';
}
