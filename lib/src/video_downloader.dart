import 'package:flutter/material.dart';
import 'video_downloader_platform_interface.dart';

class VideoDownloader {
  static bool _initialized = false;

  static Future<void> initialize() async {
    assert(!_initialized, 'FlutterDownloader.initialize() must be called only once!');

    WidgetsFlutterBinding.ensureInitialized();
    _initialized = true;
  }

  static Future<String?> getPlatformVersion() {
    return VideoDownloaderPlatform.instance.getPlatformVersion();
  }
}
