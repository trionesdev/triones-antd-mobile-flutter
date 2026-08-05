// ignore: unused_import
import 'package:intl/intl.dart' as intl;
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

  @override
  String get calendar_mon => '一';

  @override
  String get calendar_tue => '二';

  @override
  String get calendar_wed => '三';

  @override
  String get calendar_thu => '四';

  @override
  String get calendar_fir => '五';

  @override
  String get calendar_sat => '六';

  @override
  String get calendar_sun => '日';

  @override
  String get cascader_placeholder => '请选择';

  @override
  String get images_wall_camera => '拍摄照片';

  @override
  String get images_wall_album => '从相册选择';

  @override
  String get images_wall_too_large => '图片过大';

  @override
  String get images_wall_error => '上传失败';

  @override
  String get images_wall_preview => '图片预览';
}

/// The translations for Chinese, as used in China, using the Han script (`zh_Hans_CN`).
class AntdLocalizationsZhHansCn extends AntdLocalizationsZh {
  AntdLocalizationsZhHansCn() : super('zh_Hans_CN');
}
