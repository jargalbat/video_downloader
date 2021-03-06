///
/// * author: Jargalbat
/// * email: jargalbat@gmail.com
///
/// A plugin provides the capability of creating and managing background download
/// tasks. This plugin depends on native api to run background tasks, so these
/// tasks aren't restricted by the limitation of Dart codes (in term of running
/// background tasks out of scope of a Flutter application). Using native api
/// also take benefit of memory and battery management.
///
/// All task information is saved in a Sqlite database, it gives a Flutter
/// application benefit of either getting rid of managing task information
/// manually or querying task data with SQL statements easily.
///

library video_downloader;

export 'src/video_downloader.dart';