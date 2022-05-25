import 'package:flutter/material.dart';
import 'package:video_downloader/video_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VideoDownloader.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _version;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _version = await VideoDownloader.getPlatformVersion();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text(_version ?? ''),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // _insertPart();
          },
        ),
      ),
    );
  }

  void _insertPart() async {
    await VideoDownloader.insertPart();
    var list = await VideoDownloader.getAllParts();
    debugPrint('done');
  }
}
