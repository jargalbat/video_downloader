import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'video_downloader_platform_interface.dart';

/// An implementation of [VideoDownloaderPlatform] that uses method channels.
class MethodChannelVideoDownloader extends VideoDownloaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('video_downloader');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
