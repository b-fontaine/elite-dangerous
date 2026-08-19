import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the system browser on Frontier's consent screen.
///
/// Behind a port so the sign-in flow can be tested without a real browser.
abstract interface class BrowserLauncher {
  Future<bool> open(Uri url);
}

@LazySingleton(as: BrowserLauncher)
class UrlLauncherBrowserLauncher implements BrowserLauncher {
  const UrlLauncherBrowserLauncher();

  @override
  Future<bool> open(Uri url) =>
      launchUrl(url, mode: LaunchMode.externalApplication);
}
