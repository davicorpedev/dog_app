import 'package:global_configuration/global_configuration.dart';

class AppGlobalConfig {
  Future<void> setupConfiguration() async {
    await GlobalConfiguration().loadFromPath('config/config.json');
  }

  String get apiKey {
    return GlobalConfiguration().getValue('api_key');
  }

  String get baseUrl {
    return GlobalConfiguration().getValue('base_url');
  }

  String get serverVersion {
    return GlobalConfiguration().getValue('server_version');
  }
}
