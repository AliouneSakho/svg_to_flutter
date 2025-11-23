// ignore: library_annotations
@Timeout(Duration(minutes: 5))
import 'dart:io';

import 'package:io/io.dart';
import 'package:svg_to_flutter/main.dart';
import 'package:test/test.dart';

const String testDirPath = './example/camus_test';
const String testFontDirPath = '$testDirPath/assets/font';
const String testClassDirPath = '$testDirPath/class';

void main() {
  group('Camus Icon font generate', () {
    final Directory testDir = Directory(testDirPath);
    tearDownAll(() async {
      if (testDir.existsSync()) {
        testDir.deleteSync(recursive: true);
      }
    });
    test('Generate icons', () async {
      final int exitCode = await SvgToFlutterCommandRunner().run(<String>[
        'generate',
        '--input',
        './example/assets',
        '--font-output',
        testFontDirPath,
        '--class-output',
        testClassDirPath,
      ]);
      expect(exitCode, ExitCode.success.code);
      final bool isExists = testDir.existsSync();
      expect(isExists, true);
    });
  });

  test('Do not pass input parameter', () async {
    final int exitCode = await SvgToFlutterCommandRunner().run(<String>[
      'generate',
      '--font-output',
      testFontDirPath,
      '--class-output',
      testClassDirPath,
    ]);
    expect(exitCode, ExitCode.usage.code);
  });
}
