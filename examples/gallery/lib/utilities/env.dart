const _kAppBuildName = String.fromEnvironment('kAppBuildName');
const _kAppBuildNumber =
    String.fromEnvironment('kAppBuildNumber', defaultValue: '0');

class Env {
  Env._();

  /// The shared instance of [Env].
  static final Env instance = Env._();

  String appVersion = '0.0.0';

  String appBuildName = _kAppBuildName;
  int appBuildNumber = int.parse(_kAppBuildNumber);
}

final env = Env.instance;
