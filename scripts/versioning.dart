// ignore_for_file: avoid_print

import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  parser.addOption('versionName', abbr: 'v', mandatory: true);

  final args = parser.parse(arguments);
  final upcomingVersionName = args['versionName'] as String?;
  if (upcomingVersionName == null) throw 'Should provide "versionName"';

  final pubspecFile = File('pubspec.yaml');
  final versionRegex = RegExp(r'version: \d+\.\d+\.\d+.+');

  /// Example: 'version: 1.0.0-beta.13+1'
  final currentVersion = versionRegex
      .allMatches(pubspecFile.readAsStringSync())
      .map((m) => m.group(0))
      .join();

  /// Example: 1
  final int currntVersionCode = int.parse(RegExp(r'\+\d+')
      .allMatches(currentVersion)
      .map((m) => m.group(0))
      .join());

  /// Example:  1.0.0-beta.14+2
  final newVersion = '$upcomingVersionName+${currntVersionCode + 1}';
  final updatedPubspecFile = (await pubspecFile.readAsString()).replaceFirst(
    RegExp(r'version: \d+\.\d+\.\d+.+'),
    'version: $newVersion',
  );

  await pubspecFile.writeAsString(updatedPubspecFile);

  exit(0);
}
