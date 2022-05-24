import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'video_downloader_method_channel.dart';

abstract class VideoDownloaderPlatform extends PlatformInterface {
  /// Constructs a VideoDownloaderPlatform.
  VideoDownloaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static VideoDownloaderPlatform _instance = MethodChannelVideoDownloader();

  /// The default instance of [VideoDownloaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelVideoDownloader].
  static VideoDownloaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VideoDownloaderPlatform] when
  /// they register themselves.
  static set instance(VideoDownloaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
