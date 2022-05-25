import 'package:flutter/material.dart';
import 'db/entities/parts.dart';
import 'db/repositories/parts_repository.dart';
import 'video_downloader_platform_interface.dart';

class VideoDownloader {
  static bool _initialized = false;

  static Future<void> initialize() async {
    assert(!_initialized, 'VideoDownloader.initialize() must be called only once!');

    WidgetsFlutterBinding.ensureInitialized();
    _initialized = true;
  }

  static void listener() {}

  static Future<String?> getPlatformVersion() {
    return VideoDownloaderPlatform.instance.getPlatformVersion();
  }

  static Future<int> insertPart() async {
    Part part = Part(
      id: 'testId',
      partId: 'testPartId',
      videoId: 'testVideoId',
      url: 'testUrl',
      fileName: 'testFileName',
      isCompleted: false,
      time: DateTime.now(),
    );
    var repo = PartsRepository();
    return await repo.insert(part);
  }

  static Future<List<Part>> getAllParts() async {
    var repo = PartsRepository();
    return await repo.getAll();
  }
}
