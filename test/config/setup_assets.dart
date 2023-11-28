import 'dart:async';

import 'package:file/file.dart' show Directory, File, FileSystem;
import 'package:file/local.dart' show LocalFileSystem;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform/platform.dart' show LocalPlatform, Platform;

/// Loads assets/icons so test screenshots look more accurate
Future<void> setupIconFont() async {
  const FileSystem fs = LocalFileSystem();
  final Platform platform = LocalPlatform();
  final Directory flutterRoot = fs.directory(platform.environment['FLUTTER_ROOT']);

  final File iconFont = flutterRoot.childFile(
    fs.path.join(
      'bin',
      'cache',
      'artifacts',
      'material_fonts',
      'MaterialIcons-Regular.otf',
    ),
  );

  final Future<ByteData> bytes =
      Future<ByteData>.value(iconFont.readAsBytesSync().buffer.asByteData());

  await (FontLoader('MaterialIcons')..addFont(bytes)).load();
}

/// Loads fonts so test screenshots look more accurate
Future<void> setupTextFont() async {
  final fontLoader = FontLoader('Roboto')
    ..addFont(rootBundle.load('assets/fonts/Roboto-Light.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Roboto-Medium.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'));
  await fontLoader.load();
}
