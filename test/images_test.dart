import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:lisa_app/generated/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.bg).existsSync(), true);
    expect(File(Images.google).existsSync(), true);
    expect(File(Images.svgBack).existsSync(), true);
    expect(File(Images.svgFailure).existsSync(), true);
    expect(File(Images.svgHelp).existsSync(), true);
    expect(File(Images.svgLisa).existsSync(), true);
    expect(File(Images.svgSuccess).existsSync(), true);
    expect(File(Images.svgWarning).existsSync(), true);
  });
}
