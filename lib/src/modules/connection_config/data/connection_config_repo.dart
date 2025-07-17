import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segment/src/modules/connection_config/domain/connection_config_model.dart';

final Provider<ConnectionConfigRepo> connectionConfigRepoProvider =
    Provider<ConnectionConfigRepo>((_) => ConnectionConfigRepo());

// لینک ساب پیش‌فرض شما اینجاست:
const String defaultSubLink = "https://8585.hajalii.com:2096/sub/Hajali?name=Hajali";

class ConnectionConfigRepo {
  ConnectionConfigModel? config;

  // این متد بعدا برای گرفتن و ست کردن کانفیگ استفاده میشه
  Future<void> loadDefaultConfig() async {
    // این متد در قدم بعدی برات کامل میشه (در مرحله بعد دیتا رو دانلود و پارس می‌کنیم)
    // الان فقط نشون می‌ده که اینجا باید این کار رو انجام بدیم
    //
    // مثال: 
    // final configs = await fetchConfigsFromSubLink(defaultSubLink);
    // config = ConnectionConfigModel.fromJson(configs[0]); // به صورت نمونه
  }
}
